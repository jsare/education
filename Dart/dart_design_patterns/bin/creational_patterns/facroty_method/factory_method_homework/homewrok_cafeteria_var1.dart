enum CoffeeType { Latte, Cappucino, Espresso, Raf }

abstract class Coffee {
  final String name;
  final int volume;

  Coffee({required this.name, required this.volume});

  String create();

  factory Coffee.factory(CoffeeType coffeeType) {
    switch (coffeeType) {
      case CoffeeType.Latte:
        return Latte();
      case CoffeeType.Cappucino:
        return Espresso();
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
  String create() {
    return 'The coffee $name has been prepared in $volume ml';
  }

  @override
  String get name => 'Latte';

  @override
  int get volume => 340;
}

class Capuccino implements Coffee {
  @override
  String create() {
    return 'The coffee $name has been prepared in $volume ml';
  }

  @override
  String get name => 'Espresso';

  @override
  int get volume => 400;
}

// Нельзя вызывать, без именного класса Coffee.factory, иначе выдаёт ошибку.
class Espresso extends Coffee {
  Espresso() : super(name: 'Espresso', volume: 150);

  @override
  String create() {
    return 'The coffee $name has been prepared in $volume ml';
  }
}

class Raf implements Coffee {
  @override
  String create() {
    return 'The coffee $name has been prepared in $volume ml';
  }

  @override
  String get name => 'Raf';

  @override
  int get volume => 600;
}

void main(List<String> args) {
  for (var value in CoffeeType.values) {
    var coffee = Coffee.factory(value);
    print(coffee.create());
  }
}
