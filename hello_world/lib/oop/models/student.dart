class Student {
  //使用 final 或 late 关键字可以控制变量初始化时机。
  final String id;
  late String major; // 延迟初始化

  Student(this.id);

  void setMajor(String m) {
    major = m;
  }
}
