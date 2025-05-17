void testCollection() {
  //_testList();
  //_testSet();
  _testMap();
}

void _testMap() {
  //Map<String, String> animals;
  final animals = {'dog': '狗', 'cat': '猫', 'bear': '熊'};
  print(animals['dog']);
  //添加元素
  animals['bird'] = '鸟';

  //for in 遍历 map
  for (var entry in animals.entries) {
    print('${entry.key} -> ${entry.value}');
  }
  print('------');
  //移除元素
  animals.remove('cat');

  //forEach 遍历 map
  animals.forEach((key, value) {
    print('$key -> $value');
  });
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
