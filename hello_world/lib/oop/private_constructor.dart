/**
1. 核心概念：什么是私有构造函数？
    私有构造函数是一种只能在当前库（library）内部被调用的构造函数。
    通过在构造函数名称前添加下划线 _ 来定义。
 */

class MyClass {
  final int value;

  // 私有命名构造函数
  MyClass._(this.value);

  // 私有命名构造函数
  MyClass._internal(this.value);

  // 私有命名构造函数
  MyClass._private(this.value);

  // 公共方法可以创建实例
  static MyClass create(int value) {
    return MyClass._private(value);
  }
}

void testPrivateConstructor() {
  // 在同一库内可以访问私有命名构造函数
  var obj1 = MyClass._(42);
  var obj2 = MyClass._private(42);
  var obj3 = MyClass._internal(42);

  // 通过公共方法访问
  var obj4 = MyClass.create(100);
}
