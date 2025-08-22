class Person {
  String name;
  int age;
  String description;
  // 默认构造函数
  Person(this.name, this.age, this.description);

  //命名构造函数
  //this.name 直接给属性赋值
  Person.fromBirthYear(this.name, int birthYear, String desc)
    // 在初始化列表中赋值
    : age = DateTime.now().year - birthYear,
      description = desc.toUpperCase();

  void introduce() {
    print(
      'Hi, I am $name and I am $age years old. My description is $description',
    );
  }
}
