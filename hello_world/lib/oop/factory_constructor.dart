///在 Dart 中，工厂构造函数（Factory Constructor） 是一种特殊的构造函数，
///它不总是创建类的新实例，而是可以返回一个已存在的实例、子类实例，甚至是 null。
///它通过 factory 关键字定义，常用于实现单例模式、缓存对象、多态返回、解耦对象创建逻辑等高级场景。

///一、工厂构造函数的特点
////1. 不创建新实例: 可以返回已有对象（如缓存、单例）
////2. 可返回子类: 可以根据条件返回不同子类的实例
////3. 可返回null: 允许返回null（普通构造函数不允许）
////4. 不能访问this: 工厂构造函数中不能使用this，因为它在执行时实例尚未创建
////5. 必须有return语句: 必须显式返回一个对象

///二、语法格式
/**
 factory ClassName(parameters) {
  // 逻辑判断
  return existingInstance || new Instance();
}
*/

///三、工厂构造函数的常见用途与示例

////1. 单例模式（Singleton）
//// 确保一个类只有一个实例，并提供全局访问点。

class Logger {
  // 私有静态实例
  static final Logger _instance = Logger._internal();

  // 私有构造函数（防止外部 new）
  Logger._internal();

  // 工厂构造函数返回唯一实例
  factory Logger() => _instance;

  void log(String message) {
    print('[LOG] $message');
  }
}

////2. 对象缓存 / 实例复用
/// 避免重复创建相同对象，提升性能。
class User {
  final String id;
  final String name;

  // 缓存已创建的用户
  static final Map<String, User> _cache = {};

  // 私有构造函数
  User._internal(this.id, this.name);

  // 工厂构造函数：优先从缓存返回
  factory User(String id, String name) {
    return _cache.putIfAbsent(id, () => User._internal(id, name));
  }
}

//// 3. 返回子类实例（多态构造）
//// 根据参数动态返回不同子类对象。

// 抽象类
abstract class Animal {
  void speak();

  // 工厂构造函数：根据类型创建不同动物
  factory Animal(String type) {
    switch (type.toLowerCase()) {
      case 'dog':
        return Dog();
      case 'cat':
        return Cat();
      default:
        throw ArgumentError('Unknown animal type: $type');
    }
  }
}

class Dog implements Animal {
  @override
  void speak() {
    print('Woof!');
  }
}

class Cat implements Animal {
  @override
  void speak() {
    print('Meow!');
  }
}

//// 4. 解析 JSON 并返回实例
//// 常用于从 JSON 数据创建对象。
class Person {
  final String name;
  final int age;

  Person._internal(this.name, this.age);

  // 工厂构造函数：从 JSON 创建 Person
  factory Person.fromJson(Map<String, dynamic> json) {
    if (json['name'] == null) {
      throw ArgumentError('Name is required');
    }
    return Person._internal(json['name'], json['age'] ?? 0);
  }

  @override
  String toString() => 'Person(name: $name, age: $age)';
}

////5. 工厂构造函数 + 命名工厂构造函数（组合使用）
class Color {
  final int r, g, b;

  Color._(this.r, this.g, this.b);

  // 工厂构造函数：从十六进制字符串创建颜色
  factory Color.fromHex(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) {
      int val = int.tryParse(hex, radix: 16) ?? 0;
      int r = (val >> 16) & 0xff;
      int g = (val >> 8) & 0xff;
      int b = val & 0xff;
      return Color._(r, g, b);
    }
    return Color._(0, 0, 0); // 默认黑色
  }

  // 命名工厂构造函数
  factory Color.red() => Color._(255, 0, 0);
  factory Color.green() => Color._(0, 255, 0);
  factory Color.blue() => Color._(0, 0, 255);
}
