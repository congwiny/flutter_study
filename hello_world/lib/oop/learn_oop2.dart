import 'inheritance.dart';

void testOop2() {
  var animal = Animal('Animal', 2);
  animal.eat(); // 输出: Animal is eating.
  animal.makeSound(); // 输出: Animal makes a sound.

  // 创建一个 Dog 实例，使用 var自动推断类型
  var myDog = Dog('Buddy', 3, 'Golden Retriever');

  // 调用继承自 Animal 的方法
  myDog.eat(); // 输出: Buddy is eating.
  myDog.sleep(); // 输出: Buddy is sleeping.

  // 调用 Dog 自己的方法
  myDog.bark(); // 输出: Buddy (a Golden Retriever) says: Woof! Woof!

  // 调用被重写的方法
  myDog.makeSound(); // 输出: Buddy (a Golden Retriever) says: Woof! Woof!

  // 访问继承自 Animal 和自身的属性
  print('${myDog.name} is ${myDog.age} years old and is a ${myDog.breed}.');
  // 输出: Buddy is 3 years old and is a Golden Retriever.
}
