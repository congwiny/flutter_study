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
      });

  //2. 捕获异常2: 使用 try...catch
  try {
    String data = await fetchWithError();
    print(data);
  } catch (e) {
    print("捕获异常2: $e");
  }
}

void testFunAsync() async {
  print("开始请求数据...");
  String result = await fetchData(); // 等待异步函数执行完成
  print(result);
  print("请求结束");

  //testFutureThen();
  testFutureWithError();
}
