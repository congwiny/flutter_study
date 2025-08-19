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

void testFun() {
  // 调用方式
  printDetails('Alice');
  printDetails('Bob', 30);
  printDetails('Charlie', 25, 'New York');
}
