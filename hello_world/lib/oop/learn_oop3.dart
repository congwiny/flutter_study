import 'private_constructor.dart';

void testOop3() {
  testPrivateConstructor();

  var config1 = AppConfig();
  var config2 = AppConfig();

  print(identical(config1, config2)); // 输出: true
  config1.loadConfig();

  var user =
      User.builder()
          .setName('Grace')
          .setEmail('grace@example.com')
          .setAge(40)
          .addRole('admin')
          .addRole('user')
          .build();

  print('User: ${user.name}, Roles: ${user.roles}');
}
