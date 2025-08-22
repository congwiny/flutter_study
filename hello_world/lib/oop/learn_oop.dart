import 'models/person.dart';

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
  person2.introduce();
}
