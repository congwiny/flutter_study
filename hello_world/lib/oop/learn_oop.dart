import 'models/person.dart';

void testOop() {
  // 创建对象
  Person person1 = Person('Alice', 25, "Love Cat");
  person1.introduce();

  Person person2 = Person.fromBirthYear('Charlie', 1995, "Love Dog");
  person2.introduce();
}
