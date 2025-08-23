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

//在 Dart 中，每个类都隐式地定义了一个接口。
//这意味着任何类都可以被其他类实现（implements），而不仅仅是传统的接口。

//虽然任何类都可以作为接口，但通常我们使用抽象类来明确定义纯粹的接口：

// 作为纯接口使用的抽象类
abstract class Flyable {
  void fly();
}

class Swimmable {
  void swim() {
    print('swimming');
  }
}

// Duck 类 使用 extends继承一个类，可使用implements 实现多个接口
class Duck extends Animal implements Flyable, Swimmable {
  String name;

  Duck(this.name) : super(name, 3);

  @override
  void fly() {
    print('$name is flying in the sky');
  }

  @override
  void swim() {
    print('$name is swimming in the water');
  }

  // 自己的方法
  void quack() {
    print('$name says: Quack! Quack!');
  }
}

// 飞机也可以实现 Flyable 接口
class Airplane implements Flyable {
  @override
  void fly() {
    print('Airplane is flying at high altitude');
  }
}

//使用 mixin
// Mixin 是 Dart 语言中一项非常强大且独特的特性，
// 它提供了一种在类层次结构中复用代码的方法，无需使用传统的继承。
// 这对于实现类似多重继承的效果，但又避免了多重继承的复杂性

//1. 核心概念：Mixin 是什么？
//你可以将 Mixin 想象成一个代码片段或一组可复用的方法/属性，它可以被“混入”（mixed in）到其他类中。
//被混入的类会自动获得 Mixin 的所有功能（属性和方法），而无需成为其子类。
//核心目的：代码复用和组合（Composition over Inheritance）。

//2. 如何定义和使用 Mixin？
//使用 mixin 关键字来定义一个 Mixin。Mixin 本身不能直接被实例化。

///2.1 定义 Mixin
mixin Musical {
  // 可以包含属性
  bool canPlayPiano = false;

  // 可以包含方法（包括抽象方法）
  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else {
      print('Humming a tune');
    }
  }

  // 甚至可以包含抽象方法，要求混入的类必须实现它
  void stop();
}

///2.2 使用 Mixin（with 关键字）
// 一个普通的类
class Performer {
  void perform() {
    print('Performing...');
  }
}

// 使用 `with` 将 Musical Mixin 混入到 Musician 类中
class Musician extends Performer with Musical {
  // Musician 现在拥有：
  // 1. Performer 类的 perform() 方法
  // 2. Musical Mixin 的 canPlayPiano 属性和 entertainMe() 方法
  // 3. 并且必须实现 Musical Mixin 中定义的抽象方法 stop()

  @override
  void stop() {
    print('Stopping the music');
  }
}

///2.3 关键特性和规则
//// a) 混入多个 Mixin
//// 一个类可以使用 with 后跟多个用逗号分隔的 Mixin。
///  顺序很重要，后混入的 Mixin 会覆盖先前混入的 Mixin 或父类的同名方法/属性。

mixin A {
  String message = 'A';
  void log() {
    print('A.log: $message');
  }
}

mixin B {
  String message = 'B';
  void log() {
    print('B.log: $message');
  }
}

class C with A, B {}
