// 父类 / 基类
class Animal {
  String name;
  int age;

  // 默认构造函数
  Animal(this.name, this.age);

  //命名构造函数
  Animal.fromName(this.name) : age = 2;

  // 方法
  void eat() {
    print('$name is eating.');
  }

  void sleep() {
    print('$name is sleeping.');
  }

  void makeSound() {
    print('$name makes a sound.');
  }
}

// 子类 / 派生类
class Dog extends Animal {
  // Dog 类自动继承了 name, age 字段和 eat(), sleep(), makeSound() 方法。

  String breed; // Dog 类独有的属性

  // 构造函数
  // 使用 super 关键字调用父类的构造函数，来初始化从父类继承来的 name 和 age
  Dog(String name, int age, this.breed) : super(name, age);

  //子类的命名构造函数调用父类的命名构造函数。
  Dog.fromName(String name, this.breed) : super.fromName(name);

  // Dog 类独有的方法
  void bark() {
    print('$name (a $breed) says: Woof! Woof!');
  }

  // 可以重写 (Override) 父类的方法，以提供更具体的行为
  @override
  void makeSound() {
    bark(); // 调用自己的 bark 方法
  }
}

//抽象类不能被实例化
abstract class Shape {
  //抽象属性
  String get color;

  void draw(); // 抽象方法

  void commonMethod() {
    print('This is a shape.');
  }
}

//Circle 继承自 抽象类
class Circle extends Shape {
  @override
  String get color => 'Red'; //实现抽象属性
  @override
  void draw() {
    print('Drawing a $color circle.');
  }
}
