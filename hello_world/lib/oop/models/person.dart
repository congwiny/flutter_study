class Person {
  //final 只能赋值一次
  final String name;
  int age;
  //私有属性
  String _description;
  List<String> hobbies;

  // 默认构造函数
  Person(this.name, this.age, this._description, this.hobbies) {
    if (hobbies.isEmpty) {
      throw ArgumentError('hobbies cannot be empty');
    }
  }

  //命名构造函数
  //this.name 直接给属性赋值
  Person.fromBirthYear(this.name, int birthYear, String desc)
    // 在初始化列表中赋值
    : age = DateTime.now().year - birthYear,
      _description = desc.toUpperCase(),
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
      'Hi, I am $name and I am $age years old. Desc is $_description Hobbies is $hobbies',
    );
  }
}

// 在同一个库中，可以访问Person的私有成员
class Employee {
  final Person _person;

  Employee(String name, int age, String desc, List<String> hobbies)
    : _person = Person(name, age, desc, hobbies);

  void showEmployeeInfo() {
    print('Employee: ${_person.name}');
    print('Desc: ${_person._description}'); // 可以访问私有字段
    print('Hobbies: ${_person.hobbies}');
  }
}
