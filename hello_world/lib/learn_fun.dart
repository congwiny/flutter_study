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
void printUser({required String name, int age = 18, String? city}) {
  print('Name: $name');
  print('Age: $age');
  if (city != null) print('City: $city');
}

void testFun() {
  // 位置可选参数调用方式
  printDetails('Alice');
  printDetails('Bob', 30);
  printDetails('Charlie', 25, 'New York');

  // 命名可选参数调用方式
  printUser(name: 'Alice');
  printUser(name: 'Bob', age: 30);
  printUser(name: 'Charlie', city: 'London', age: 25);
}
