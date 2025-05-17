void greet() {
  print('Hello world');
}

void runDemo() {
  var title;
  print('title=${title}');

  title = '小白兔开发';
  print('title=${title}');

  getGasoline() {
    return 0;
  }

  drive() {
    var gasoline = getGasoline();
    if (gasoline == 0) {
      throw '没油了';
    }
    print('呜呜～');
  }

  drive();
}
