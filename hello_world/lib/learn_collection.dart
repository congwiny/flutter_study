void testCollection() {
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
