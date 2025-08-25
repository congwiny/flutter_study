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
