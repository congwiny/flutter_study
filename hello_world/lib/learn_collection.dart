void testCollection() {
  //_testList();
  _testSet();
}

void _testSet() {
  //Set<String> animals;
  final animals = {'狗', '猫', '熊'};
  //for in
  for (var animal in animals) {
    print(animal);
  }

  animals.add('猫');
  //Set.forEach
  animals.forEach((animal) {
    print(animal);
  });
}

//任何以 _ 开头的标识符，都是“库私有（library-private）”
void _testList() {
  final animals = ['狗', '猫', '熊'];
  //for in
  for (var animal in animals) {
    print(animal);
  }

  animals.add('兔');
  //list.forEach
  animals.forEach((animal) {
    print(animal);
  });
}
