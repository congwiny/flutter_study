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

void testFun() {
  add2(1, 2);
}
