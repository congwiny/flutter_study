import 'dart:async';

///1. 为什么需要异步函数
////在 Dart 中，某些操作（例如 网络请求、文件读取、数据库操作）需要较长时间才能完成。
////如果这些操作在主线程中以同步方式执行，会导致 UI 卡顿 或 阻塞后续逻辑。
////为此，Dart 提供了 异步编程机制，主要通过：
//// 1. Future：表示一个 可能在将来某个时间点才会有结果 的对象。
//// 2. Stream：表示一系列异步的数据事件（类似于持续的 Future 流）。

///2. async / await 关键字
////async：将函数声明为异步函数，返回值会被自动封装为 Future<T>。
////await：只能在 async 函数中使用，用于等待一个 Future 完成并返回结果。

// 模拟一个耗时操作，例如网络请求
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2)); // 模拟耗时 2 秒
  return "数据加载完成";
}

///3. Future 的使用方式
////1. 使用 then 处理 Future
void testFutureThen() {
  fetchData().then((value) {
    print('加载结果：$value');
  });
}

////2. 处理异常
Future<String> fetchWithError() async {
  await Future.delayed(Duration(seconds: 1));
  throw Exception("网络错误");
}

void testFutureWithError() async {
  //1. 捕获异常1: 使用 Future.catchError
  fetchWithError()
      .then((value) {
        print('加载结果：$value');
      })
      .catchError((error) {
        print("捕获异常1: $error");
      })
      .whenComplete(() {
        //无论异步任务执行成功或失败都会执行到whenComplete
        print("任务执行完成");
      });

  //2. 捕获异常2: 使用 try...catch
  try {
    String data = await fetchWithError();
    print(data);
  } catch (e) {
    print("捕获异常2: $e");
  }
}

///4.多个异步操作的顺序执行
Future<String> task1() async {
  await Future.delayed(Duration(seconds: 1));
  return "任务1完成";
}

Future<String> task2() async {
  await Future.delayed(Duration(seconds: 1));
  return "任务2完成";
}

///5. 多个异步操作的并发执行

void testFunAsync() async {
  // print("开始请求数据...");
  // String result = await fetchData(); // 等待异步函数执行完成
  // print(result);
  // print("请求结束");

  //testFutureThen();
  //testFutureWithError();

  print("开始执行任务...");
  //多个异步操作的顺序执行
  // String result1 = await task1();
  // print(result1);

  // String result2 = await task2();
  // print(result2);

  //  print("所有任务完成");
  // List<String> results = await Future.wait([task1(), task2()]);
  // print(results); // ["任务1完成", "任务2完成"]

  // //Future.wait 之后添加 then 和 catchError
  // Future.wait([task1(), task2()])
  //     .then((results) {
  //       print(results[0] + results[1]);
  //     })
  //     .catchError((e) {
  //       print(e);
  //     });

  ///await for 用于监听流中的每个值。
  // await for (int value in countStream(5)) {
  //   print("接收到: $value");
  // }

  //testStreamFromFutures();

  testFutureOtherUse();
}

///6. Stream 的异步函数
////1. 当需要持续接收数据（如 WebSocket、事件流），可以使用 async* 生成 Stream。
///
//// async* 表示这是一个异步生成器函数，返回 Stream。
///  yield 用于发出一个值。
///

// 生成一个每秒输出一个数字的流
Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i; // 类似 return，但可以多次返回
  }
}

////2. Stream.fromFutures

void testStreamFromFutures() {
  Stream.fromFutures([
    // 1秒后返回结果
    Future.delayed(Duration(seconds: 1), () {
      return "hello 1";
    }),
    // 抛出一个异常
    Future.delayed(Duration(seconds: 2), () {
      throw AssertionError("Error");
    }),
    // 3秒后返回结果
    Future.delayed(Duration(seconds: 3), () {
      return "hello 3";
    }),
  ]).listen(
    (data) {
      print(data);
    },
    onError: (e) {
      print(e.message);
    },
    onDone: () {
      print("onDone");
    },
  );
}

///7. Future其他用法
void testFutureOtherUse() async {
  ////1.使用 Future.sync 创建同步 Future（调试用）
  Future<String> syncFuture = Future.sync(() => "立即返回");
  testFutureTimeOut();
}

////2. timeout设置超时
Future<String> slowTask() {
  return Future.delayed(Duration(seconds: 3), () {
    return "任务完成";
  });
}

void testFutureTimeOut() async {
  try {
    // 设置最多等待 2 秒
    String result = await slowTask().timeout(Duration(seconds: 2));
    print(result);
  } on TimeoutException {
    print("超时了：任务耗时太长！");
  } on Exception catch (e) {
    print("其他异常: $e");
  }
}
