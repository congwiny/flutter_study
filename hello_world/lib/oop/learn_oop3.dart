import 'private_constructor.dart';

void testOop3() {
  testPrivateConstructor();

  var config1 = AppConfig();
  var config2 = AppConfig();

  print(identical(config1, config2)); // 输出: true
  config1.loadConfig();
}
