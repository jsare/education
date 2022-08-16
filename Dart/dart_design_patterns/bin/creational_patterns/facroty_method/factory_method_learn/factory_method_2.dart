enum PizzaType { Mexico, Margarita, Stella }

/*
Пример с последующими классами, которые НЕ НАСЛЕДУЮТСЯ от Pizza, а будут реализовывать только интерфейс.
*/

abstract class Pizza {
  final int radius = 0;
  final String name = '';

// Используется НЕИМЕНОВАННЫЙ конструктор, а просто основной.
  factory Pizza(PizzaType pizzaType) {
    switch (pizzaType) {
      case PizzaType.Margarita:
        return Margarita();
      case PizzaType.Stella:
        return Stella();
      case PizzaType.Mexico:
        return Mexico();
      default:
        throw ArgumentError();
    }
  }
}

class Margarita implements Pizza {
  @override
  String get name => 'Margarita';

  @override
  int get radius => 20;

  @override
  String toString() {
    return 'Pizza $name has $radius cm';
  }
}

class Stella implements Pizza {
  @override
  String get name => 'Stella';

  @override
  int get radius => 20;

  @override
  String toString() {
    return 'Pizza $name has $radius cm';
  }
}

class Mexico implements Pizza {
  @override
  String get name => 'Mexico';

  @override
  int get radius => 15;

  @override
  String toString() {
    return 'Pizza $name has $radius cm';
  }
}

void main(List<String> args) {
  for (var value in PizzaType.values) {
    var pizza = Pizza(value);
    print(pizza.toString());
  }
}
