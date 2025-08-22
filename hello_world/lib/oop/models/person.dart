class Person {
  String name;
  int age;
  // 构造函数
  Person(this.name, this.age);

  void introduce() {
    print('Hi, I am $name and I am $age years old.');
  }
}
