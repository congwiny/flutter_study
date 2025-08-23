import 'inheritance.dart';

void testOop2() {
  var animal = Animal('Animal', 2);
  animal.eat(); // 输出: Animal is eating.
  animal.makeSound(); // 输出: Animal makes a sound.

  //子类对象可以赋值给父类引用，调用重写的方法时体现多态。
  Animal myDog = Dog('Buddy', 3, 'Golden Retriever');

  //调用继承自 Animal 的方法
  myDog.eat(); // 输出: Buddy is eating.
  myDog.sleep(); // 输出: Buddy is sleeping.

  // 无法调用 Dog 的方法
  //myDog.bark();

  // 调用被重写的方法
  myDog.makeSound(); // 输出: Buddy (a Golden Retriever) says: Woof! Woof!

  // 访问继承自 Animal的属性
  print('${myDog.name} is ${myDog.age} years old');
  // 输出: Buddy is 3 years old

  //无法访问Dog的属性
  // print('${myDog.breed}');
}
