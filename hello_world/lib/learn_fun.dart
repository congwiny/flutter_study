///一 基本函数定义
///简单函数
////1.无返回值函数
void greet() {
  print("Hello");
}

////2.有返回值
int add(int a, int b) {
  return a + b;
}

///单表达式函数
int add2(int a, int b) => a + b;

///二 函数参数
////1. 必须位置参数
void printSum(int a, int b) {
  print(a + b);
}

////2. 位置可选参数 []
////   位置可选参数顺序固定，带默认值的必须放在最后
void printDetails(String name, [int? age, String? city = 'beijing']) {
  print('Name: $name');
  if (age != null) print('Age: $age');
  if (city != null) print('City: $city');
}

////3. 命名可选参数 {}
////   命名参数用 {} 包裹，调用时需指定参数名
////   注意： 命名可选参数的参数有以下要求：
///       1.使用 required
///       2.给赋值
///       3.给可空的参数
void printUser(int id, {required String name, int age = 18, String? city}) {
  print('Id: $id');
  print('Name: $name');
  print('Age: $age');
  if (city != null) print('City: $city');
}

///三 函数作为一等公民
///1. 将函数赋值给变量
var hello = (String name) => print('Hello, $name!');

///2. 函数作为参数
void executeFunction(void Function() fn) {
  fn();
}

///3. 函数作为返回值
Function multiplyBy(int multiplier) {
  return (int value) => value * multiplier;
}

void testFun() {
  // 位置可选参数调用方式
  printDetails('Alice');
  printDetails('Bob', 30);
  printDetails('Charlie', 25, 'New York');

  // 命名可选参数调用方式
  printUser(1, name: 'Alice');
  printUser(2, name: 'Bob', age: 30);
  printUser(3, name: 'Charlie', city: 'London', age: 25);

  //调用函数变量
  hello('Alice');

  //调用函数作为参数
  executeFunction(() => print('Executed!'));

  //返回一个函数
  var doubleIt = multiplyBy(2);
  print(doubleIt(5)); // 输出 10

  ///四 匿名函数（Lambda / inline function）
  var list = [1, 2, 3];
  // 匿名函数（块）
  list.forEach((item) {
    print(item * 2);
  });
  // 简写形式
  list.forEach((item) => print(item * 2));

  // 匿名函数（箭头）
  var doubled = list.map((n) => n * 2).toList();
  print(doubled); // [2, 4, 6]
}
