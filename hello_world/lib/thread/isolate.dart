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
  testCompute();
}

void testCompute() async {
  print('主Isolate开始: ${DateTime.now()}');

  // 使用compute将耗时函数抛到新的Isolate执行
  // 第一个参数是函数名，第二个是参数
  final result = await compute(expensiveCalculation, 1000000000);

  print('结果是: $result');
  print('主Isolate结束: ${DateTime.now()}');
}
