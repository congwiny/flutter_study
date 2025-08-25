/**
1. 核心概念：什么是私有构造函数？
    私有构造函数是一种只能在当前库（library）内部被调用的构造函数。
    通过在构造函数名称前添加下划线 _ 来定义。
 */

class MyClass {
  final int value;

  // 私有命名构造函数
  MyClass._(this.value);

  // 私有命名构造函数
  MyClass._internal(this.value);

  // 私有命名构造函数
  MyClass._private(this.value);

  // 公共方法可以创建实例
  static MyClass create(int value) {
    return MyClass._private(value);
  }
}

void testPrivateConstructor() {
  // 在同一库内可以访问私有命名构造函数
  var obj1 = MyClass._(42);
  var obj2 = MyClass._private(42);
  var obj3 = MyClass._internal(42);

  // 通过公共方法访问
  var obj4 = MyClass.create(100);
}

/**
2. 主要用途和场景
用途 1：实现单例模式（Singleton）
 */
class AppConfig {
  // 私有构造函数
  AppConfig._internal() {
    print('AppConfig initialized');
  }

  // 静态单例实例
  static final AppConfig _instance = AppConfig._internal();

  // 工厂构造函数提供全局访问点
  factory AppConfig() => _instance;

  // 实例方法
  void loadConfig() {
    print('Loading configuration...');
  }
}

/**
 2. 实现建造者模式（Builder Pattern）
 */
class User {
  final String name;
  final String email;
  final int age;
  final List<String> roles;

  User._({
    required this.name,
    required this.email,
    required this.age,
    required this.roles,
  });

  // 工厂构造函数提供简单的创建方式
  factory User.create(String name, String email, int age) {
    return User._(name: name, email: email, age: age, roles: []);
  }

  // 静态方法返回 builder
  static UserBuilder builder() {
    return UserBuilder();
  }
}

class UserBuilder {
  String? _name;
  String? _email;
  int? _age;
  List<String> _roles = [];

  UserBuilder setName(String name) {
    _name = name;
    return this;
  }

  UserBuilder setEmail(String email) {
    _email = email;
    return this;
  }

  UserBuilder setAge(int age) {
    _age = age;
    return this;
  }

  UserBuilder addRole(String role) {
    _roles.add(role);
    return this;
  }

  User build() {
    if (_name == null || _email == null || _age == null) {
      throw StateError('Name, email, and age are required');
    }
    return User._(name: _name!, email: _email!, age: _age!, roles: _roles);
  }
}
