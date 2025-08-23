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

  //testAbstract();
  //testInterface();
  testMixin();
}

void testAbstract() {
  Shape circle = Circle();
  circle.draw(); // 输出: Drawing a Red circle.
}

void testInterface() {
  Duck donald = Duck('Donald');
  donald.fly(); // 输出: Donald is flying in the sky
  donald.swim(); // 输出: Donald is swimming in the water
  donald.quack(); // 输出: Donald says: Quack! Quack!

  Airplane boeing = Airplane();
  boeing.fly(); // 输出: Airplane is flying at high altitude

  // 多态的使用
  List<Flyable> flyingObjects = [Duck('Daffy'), Airplane()];
  for (var obj in flyingObjects) {
    obj.fly();
  }
}

void testMixin() {
  var musician = Musician();
  // musician.perform(); // 输出: Performing... (来自 Performer 类)
  // musician.entertainMe(); // 输出: Humming a tune (来自 Musical Mixin)
  // musician.canPlayPiano = true;
  // musician.entertainMe(); // 输出: Playing piano (来自 Musical Mixin)
  // musician.stop(); // 输出: Stopping the music (由 Musician 类实现)

  var c = C();
  c.log(); // 输出: B.log: B
  print(c.message); // 输出: B
  // 因为 B 在 A 之后混入，所以 B 的成员覆盖了 A 的成员

  testLinearization();
}
