import 'person.dart';

// 在不同一个库中，不可以访问Person的私有成员
class Employee2 {
  final Person _person; // 可以访问Person类型

  Employee2(String name, int age, String desc, List<String> hobbies)
    : _person = Person(name, age, desc, hobbies);

  void showEmployeeInfo() {
    print('Employee: ${_person.name}');
    //print('Desc: ${_person._description}'); // 不可以访问私有字段
    _person.desc = "congwiny"; //通过公共setter修改
    print('Desc: ${_person.desc}'); //通过公共getter访问

    print('Hobbies: \$${_person.hobbies}');
  }
}
