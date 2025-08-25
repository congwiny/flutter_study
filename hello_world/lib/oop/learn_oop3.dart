import 'private_constructor.dart' as p;
import 'factory_constructor.dart' as f;

void testOop3() {
  p.testPrivateConstructor();

  var config1 = p.AppConfig();
  var config2 = p.AppConfig();

  print(identical(config1, config2)); // 输出: true
  config1.loadConfig();

  var user =
      p.User.builder()
          .setName('Grace')
          .setEmail('grace@example.com')
          .setAge(40)
          .addRole('admin')
          .addRole('user')
          .build();

  print('User: ${user.name}, Roles: ${user.roles}');

  testFactoryConstructor();
}

void testFactoryConstructor() {
  f.Logger logger1 = f.Logger();
  f.Logger logger2 = f.Logger();

  print(identical(logger1, logger2)); // true，同一个实例
  logger1.log('Hello Dart!');

  //工厂构造函数：根据类型创建不同子类实例（多态构造）
  //应用场景：工厂模式、依赖注入、插件系统等。
  f.Animal dog = f.Animal('dog');
  f.Animal cat = f.Animal('cat');
  dog.speak(); // Woof!
  cat.speak(); // Meow!

  Map<String, dynamic> jsonData = {'name': 'Bob', 'age': 30};
  f.Person person = f.Person.fromJson(jsonData);
  print(person); // Person(name: Bob, age: 30)

  f.Color red1 = f.Color.red();
  f.Color red2 = f.Color.fromHex('#FF0000');
  f.Color custom = f.Color.fromHex('#3498db');

  print('Red: ${red1.r}, ${red1.g}, ${red1.b}'); // 255, 0, 0
  print('Custom: ${custom.r}, ${custom.g}, ${custom.b}'); // 52, 152, 219
}
