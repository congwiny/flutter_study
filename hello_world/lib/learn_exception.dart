void greet() {
  print('Hello world');
}

class NoGasException implements Exception {
  //message属性
  String message;
  //构造函数，接收参数赋值给message属性
  NoGasException(this.message);
}

void runDemo() {
  getGasoline() {
    return 0;
  }

  drive() {
    var gasoline = getGasoline();
    if (gasoline == 0) {
      throw NoGasException('没有油了！');
    }
    print('呜呜～');
  }

  try {
    drive();
  } on NoGasException catch (error) {
    print(error.message);
  }
}
