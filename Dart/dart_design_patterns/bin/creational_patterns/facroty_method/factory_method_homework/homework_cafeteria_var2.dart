enum CoffeeType { Latte, Capuccino, Espresso, Raf }

final Map<String, int> CoffeeComposition = {};

final Map<String, int> LatteComposition = {
  'Milk': 100,
  'Espresso': 40,
};

final Map<String, int> CapuccinoComposion = {
  'Espresso': 100,
  'Milk': 250,
  'MilkFoam': 50,
};

final Map<String, int> EspressoComposition = {
  'Espresso': 100,
  'Milk': 250,
  'MilkFoam': 50,
};

final Map<String, int> RafComposition = {
  'Coffee': 100,
  'Water': 250,
  'Cream': 50,
  'Sugar': 10,
  'Vanilla Sugar': 20,
};

// final EspressoComposition { Water, Coffee }
// enum RafComposotion { Coffee, Water, Cream, Sugar, VanillaSugar }

final Map<String, Map<String, int>> CoffeeCompositions = {
  'Latte': LatteComposition,
  'Capuccino': CapuccinoComposion,
  'Espresso': EspressoComposition,
  'Raf': RafComposition,
};

abstract class Coffee {
  final String name = '';
  final int volume = 0;
  final Map composition = {};

  String preparedCoffee();

  factory Coffee(CoffeeType coffeeType) {
    switch (coffeeType) {
      case CoffeeType.Latte:
        return Latte();
      case CoffeeType.Capuccino:
        return Cappucino();
      case CoffeeType.Espresso:
        return Espresso();
      case CoffeeType.Raf:
        return Raf();
      default:
        throw ArgumentError();
    }
  }
}

class Latte implements Coffee {
  @override
  String get name => 'Latte';

  @override
  int get volume => 150;

  @override
  final Map composition = LatteComposition;

  @override
  String preparedCoffee() {
    return '$name is prepared from ${LatteComposition.entries.toList().map((e) => '${e.key} : ${e.value.toString()}').join(', ')} a volume of $volume ml';
  }
}

class Cappucino implements Coffee {
  @override
  String get name => 'Cappuccio';

  @override
  int get volume => 150;

  @override
  final Map composition = CapuccinoComposion;

  @override
  String preparedCoffee() {
    return '$name is prepared from ${LatteComposition.entries.toList().map((e) => '${e.key} : ${e.value.toString()}').join(', ')} a volume of $volume ml';
  }
}

class Espresso implements Coffee {
  @override
  String get name => 'Espresso';

  @override
  int get volume => 150;

  @override
  final Map composition = EspressoComposition;

  @override
  String preparedCoffee() {
    return '$name is prepared from ${EspressoComposition.entries.toList().map((e) => '${e.key} : ${e.value.toString()}').join(', ')} a volume of $volume ml';
  }
}

class Raf implements Coffee {
  @override
  String get name => 'Raf';

  @override
  int get volume => 450;

  @override
  final Map composition = RafComposition;

  @override
  String preparedCoffee() {
    return '$name is prepared from ${RafComposition.entries.toList().map((e) => '${e.key} : ${e.value.toString()}').join(', ')} a volume of $volume ml';
  }
}

void main() {
  for (var type in CoffeeType.values) {
    var coffee = Coffee(type);
    print(coffee.preparedCoffee());
  }
}
