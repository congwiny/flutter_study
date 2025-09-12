/**
  Isolate - 真正的并行“多线程”
    当你需要执行真正重量级的、长时间运行的CPU计算时，Future 就无能为力了。这时就需要 Isolate。
    它是什么？ 
        你可以把它理解成一个独立的Dart运行环境。每个 Isolate 都拥有自己独立的内存空间（堆） 和独立的事件循环。
    核心区别： Isolate 之间不共享内存。
        它们之间的通信唯一的方式是通过传递消息（Message Passing）。
        这避免了传统多线程编程中复杂的锁竞争问题，但也意味着数据传输是拷贝而非共享。

    适用场景：
      图像/音频/视频处理
      大规模数学计算、加密、压缩
      解析大型JSON或XML文件
      任何可能引起界面掉帧的繁重CPU任务
 */

///Dart提供了 Isolate 类和更易用的 compute 函数。

import 'package:flutter/foundation.dart'; // 引入compute
import 'dart:isolate';

// 一个非常耗时的函数
int expensiveCalculation(int number) {
  int result = 0;
  for (int i = 0; i < number; i++) {
    result += i;
  }
  print('计算完成！'); // 这会在Isolate中打印
  return result;
}

void testIsolate() {
  //testCompute();
  testIsolateUse();
}

void testCompute() async {
  print('主Isolate开始: ${DateTime.now()}');

  // 使用compute将耗时函数抛到新的Isolate执行
  // 第一个参数是函数名，第二个是参数
  final result = await compute(expensiveCalculation, 1000000000);

  print('结果是: $result');
  print('主Isolate结束: ${DateTime.now()}');
}

void testIsolateUse() async {
  print('主Isolate开始');

  if (kIsWeb) {
    // Web 不支持 dart:isolate，走分批异步策略（不会阻塞 UI）
    print('在 Web 平台：使用非-isolate 分批异步计算');
    final result = await computeOnWebLike(1_000_000_000);
    print('Web 计算结果: $result');
    return;
  }

  // 创建主要的接收端口（收到来自新Isolate的消息）
  final receivePort = ReceivePort();

  // 错误和退出端口，用于捕获 isolate 的异常和退出事件
  final errorPort = ReceivePort();
  final exitPort = ReceivePort();

  // spawn 并注册 onError 和 onExit
  Isolate isolate;
  try {
    isolate = await Isolate.spawn(
      heavyTask,
      receivePort.sendPort,
      onError: errorPort.sendPort,
      onExit: exitPort.sendPort,
    );
  } catch (e, st) {
    print('Isolate.spawn 抛出异常: $e\n$st');
    return;
  }

  // 监听正常消息
  receivePort.listen((message) {
    if (message is Map && message.containsKey('progress')) {
      print('进度: ${message['progress']}%');
    } else if (message is String) {
      print('收到消息: $message');
    } else if (message is int) {
      print('收到结果: $message');
      // 计算完成，关闭端口并停止 isolate
      receivePort.close();
      errorPort.close();
      exitPort.close();
      isolate.kill(priority: Isolate.immediate); // 杀死Isolate，释放资源
    } else {
      print('收到其他类型消息: $message');
    }
  });

  // 监听错误端口（isolate 内未捕获的异常会到这里）
  errorPort.listen((dynamic errorData) {
    // errorPort 收到的是 List<dynamic> [error, stackTrace]
    print('来自 isolate 的错误: $errorData');
  });

  // 监听退出端口
  exitPort.listen((_) {
    print('isolate 已退出');
  });
}

// 新 Isolate 的入口：期望接收一个 SendPort（主Isolate 的 sendPort）
void heavyTask(SendPort sendPort) {
  try {
    sendPort.send('计算开始啦！');

    final int n = 1_000_000_000;
    final int batchSize = 10_000_000; // 可调，控制每次循环量
    int result = 0;
    int processed = 0;

    for (int start = 0; start < n; start += batchSize) {
      final int end = (start + batchSize < n) ? start + batchSize : n;
      for (int i = start; i < end; i++) {
        result += i;
      }
      processed += (end - start);

      // 每完成若干批发送一次进度（避免消息太频繁）
      final double progress = processed / n * 100;
      sendPort.send({'progress': progress.toStringAsFixed(2)});
    }

    // 发送结果（int 是可发送的）
    sendPort.send(result);
  } catch (e, st) {
    // 抛出异常，让 Dart 的 isolate 错误通道捕获（onError）
    // 也可以主动 send 回主 isolate：sendPort.send({'error': e.toString()})
    rethrow; // 让系统把错误发到 onError 端口（spawn 时注册）
  }
}

// 在 Web 平台时使用的“分批异步”实现（不会阻塞 UI）
Future<int> computeOnWebLike(int n) async {
  final int batchSize = 5_000_000;
  int result = 0;
  for (int start = 0; start < n; start += batchSize) {
    final int end = (start + batchSize < n) ? start + batchSize : n;
    for (int i = start; i < end; i++) {
      result += i;
    }
    // 给 UI 一次机会去处理事件（避免浏览器卡死）
    await Future<void>.delayed(Duration(milliseconds: 1));
  }
  return result;
}
