class Person {
  //final 只能赋值一次
  final String name;
  int age;
  String description;
  List<String> hobbies;

  // 默认构造函数
  Person(this.name, this.age, this.description, this.hobbies) {
    if (hobbies.isEmpty) {
      throw ArgumentError('hobbies cannot be empty');
    }
  }

  //命名构造函数
  //this.name 直接给属性赋值
  Person.fromBirthYear(this.name, int birthYear, String desc)
    // 在初始化列表中赋值
    : age = DateTime.now().year - birthYear,
      description = desc.toUpperCase(),
      hobbies = [] {
    // 构造函数体：执行复杂逻辑
    if (age < 18) {
      hobbies.add('Studying');
    } else {
      hobbies.add('Working');
    }
  }

  void introduce() {
    print(
      'Hi, I am $name and I am $age years old. Desc is $description Hobbies is $hobbies',
    );
  }
}
