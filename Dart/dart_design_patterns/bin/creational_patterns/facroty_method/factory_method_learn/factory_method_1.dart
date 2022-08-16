enum PizzaType { Margarita, Mexico, Stella }

abstract class Pizza {
  final int radius;
  final String name;

  Pizza({required this.name, required this.radius});

/*
Случай, когда ОБЯЗАННОСТЬ С ОТДЕЛЬНОГО КЛАССА ПЕРЕНОСИТСЯ В БАЗОВЫЙ КЛАСС.
Реализуется это с помощью factory-коструктора. Создание происходит через именованный конструктор Pizza.factory,
Задавая туда тип в виде enum PizzyType. И в зависимости от этого типа, будет создаваться экземпляр
класса, приводится к ИНТЕРФЕЙСУ БАЗОВОГО КЛАССА Pizza
*/
  factory Pizza.factory(PizzaType pizzaType) {
    switch (pizzaType) {
      case PizzaType.Margarita:
        return Margarita('Margarita', 15, 3.1);
      case PizzaType.Stella:
        return Stella('Stella', 25);
      case PizzaType.Mexico:
        return Mexico('Mexico', 50, 13.4);
      default:
        throw ArgumentError();
    }
  }

  double costPizza();

  @override
  String toString() {
    return 'Pizza $name has radius $radius cm';
  }
}

class Margarita extends Pizza {
  final double scallingFactor;

  Margarita(String name, int radius, this.scallingFactor)
      : super(name: name, radius: radius);

  @override
  double costPizza() {
    return radius * scallingFactor;
  }
}

class Stella extends Pizza {
  final int costPerCentimetr = 5;

  Stella(String name, int radius) : super(name: name, radius: radius);

  @override
  double costPizza() {
    return (radius * 2 * costPerCentimetr).toDouble();
  }
}

class Mexico extends Pizza {
  final double cost;

  Mexico(String name, int radius, this.cost)
      : super(name: name, radius: radius);

  @override
  double costPizza() {
    return cost;
  }
}

void main(List<String> args) {
  for (var value in PizzaType.values) {
    var pizza = Pizza.factory(
        value); // Вызываем именованный конструктор Pizza.factory, в который опракидываем значение(value) enum из PizzaType
    print(pizza.toString() + ' with cost = ' + pizza.costPizza().toString());
  }
}
