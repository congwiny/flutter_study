void greet() {
  print('Hello world');
}

class NoGasException implements Exception {}

void runDemo() {
  getGasoline() {
    return 0;
  }

  drive() {
    var gasoline = getGasoline();
    if (gasoline == 0) {
      throw NoGasException();
    }
    print('呜呜～');
  }

  drive();
}
