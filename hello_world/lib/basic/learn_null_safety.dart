///空安全
///目标：在编译期消除 NullPointerException（空引用错误）
///原则：类型默认非空，需要可空性时显式声明
///
testNullSafety() {
  //类型系统
  //1.非空类型
  String name;
  name = 'aa';
  print(name); //aa

  //2.可空类型，默认值为null
  String? avatar;
  print(avatar); //null
  //2.1 可空类型安全调用
  print(avatar?.length); //null

  //2.2 检测可空类型为空时使用默认值
  String? input;
  var text = input ?? 'default'; // 使用 ??
  print(text); //default

  //2.3 空赋值 ??=
  String? msg;
  msg ??= 'init'; //仅在msg变量为 null 时赋值，msg不为null时不赋值
  print(msg); //init

  //2.4 非空断言 !, 操作符绕过了编译器的保护，要谨慎使用
  String? word;
  //print(word!.length); // 如果 word 是 null 会抛异常

  //2.5 延迟初始化 late
  //当一个非空变量无法立即初始化时，可以用 late 声明，让它稍后初始化：
  //延迟初始化（必须在第一次使用前赋值）
  //如果 late 变量在使用前没赋值，会抛 LateInitializationError
  late String title;

  void init() {
    title = 'Dart Null Safety';
  }

  //print(title); //LateInitializationError
  init();
  print(title); //Dart Null Safety

  //2.6 可空的集合类型
  List<String>? list1; // list1 可以为 null
  List<String?> list2; // list2 不为 null，但元素可以为 null
  List<String?>? list3; // list3 可为 null，且元素也可为 null

  //2.7 类型收窄
  printLength(title);
}

void printLength(String? text) {
  if (text != null) {
    // 这里 text 被自动提升为 String 类型
    print(text.length);
  }
}
