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
}
