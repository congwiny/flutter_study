void testVar() {
  //1. 基本规则
  //var 是一个类型推断关键字，其实际类型由首次赋值确定（编译时固定）。
  var t = "hi world";
  //后续赋值必须与首次推断的类型兼容，否则会编译报错。
  t = "1000";
  //t = 1000;  类型error

  //2. 特殊情况：未初始化时
  //如果 var 变量未初始化，Dart 会将其类型推断为 dynamic，此时可以赋任意值（但通常应避免这种用法）：
  var v; // 类型为 dynamic
  v = 10; // 合法
  v = 'text'; // 合法（但失去类型安全）
  print(v);

  testDynamic();
}

///dynamic 动态类型
///关闭静态类型检查，编译器不会在编译时进行类型推断或报错。
///任何操作（如调用方法、访问属性）在编译时都能通过，但可能在运行时抛出错误（如 NoSuchMethodError）。
///
///完全不保证类型安全，处理未知类型的动态类型数据（如从 API 返回的 JSON）。
///绕过静态类型检查，使用时需自行确保类型正确。
void testDynamic() {
  dynamic x = 'hello';
  //x.foo(); // 编译通过，但运行时报错（String 没有 foo 方法）

  //dynamic 会传播动态性：
  dynamic a = 42;
  var b = a + 10; // b 的类型也是 dynamic

  //如果需要变量能赋任意类型的值，应显式使用 dynamic：
  dynamic data = 100;
  data = 'hello'; // 合法
}

///Object
///是所有 Dart 类型的基类，开启静态类型检查。
///只能调用 Object 的方法（如 toString()、hashCode），其他操作需要显式类型转换。
///
///更安全，强制开发者明确处理类型转换，避免意外错误。
void testObject() {
  Object x = 'hello';
  //x.foo(); // 编译报错：Object 没有 foo 方法
  (x as String).toLowerCase(); // 需要显式转型

  //Object 不会传播：
  Object a = 42;
  //var b = a + 10; // 编译报错：Object 不能用于 +
}
