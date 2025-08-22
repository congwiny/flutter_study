import 'models/person.dart';
import 'models/employee.dart';
import 'models/immutable_point.dart';
import 'models/student.dart';

void testOop() {
  // 创建对象
  try {
    Person person1 = Person('Alice', 25, "Love Cat", []);
    person1.introduce();
  } on ArgumentError catch (e) {
    print("捕获到异常: ${e.message}"); //捕获到异常: hobbies cannot be empty
  }

  Person person2 = Person.fromBirthYear('Charlie', 1995, "Love Dog");
  person2.introduce();
  //person2.name = 'sss'; // 错误，name是 final类型的，无法修改
  person2.age = 50;
  //person2._description; // 不同库，不可以访问Person私有字段

  print('Person2 Desc: ${person2.desc}'); //通过公共getter访问

  person2.introduce();

  Employee employee = Employee('Alice', 25, "Love Cat", ['Sing']);
  employee.showEmployeeInfo(); //Employee 与 Person相同库，可以访问Person私有变量

  Employee2 employee2 = Employee2('Alice', 25, "Love Cat", ['Sing']);
  employee2.showEmployeeInfo();

  //可变对象，不相等
  ImmutablePoint p1 = ImmutablePoint(1, 2);
  ImmutablePoint p2 = ImmutablePoint(1, 2);
  print(identical(p1, p2)); // false

  // const不可变对象
  const p11 = ImmutablePoint(1, 2);
  const p22 = ImmutablePoint(1, 2);
  print(identical(p11, p22)); // true，常量对象会被复用

  Student s = Student('S001');
  s.setMajor('Computer Science');
  print(s.major); // 输出: Computer Science
}
