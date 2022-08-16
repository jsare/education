enum PizzaType { Margarita, Mexico, Stella }

abstract class Pizza {
  final int radius;
  final String name;

  Pizza({required this.name, required this.radius});

  double costPizza();

  @override
  String toString() {
    return 'Pizza $name has radius $radius cm';
  }
}

class Margarita extends Pizza {
  final double scalingFactor;

  Margarita(String name, int radius, this.scalingFactor)
      : super(name: name, radius: radius);

  @override
  double costPizza() {
    return radius * scalingFactor;
  }
}

class Stella extends Pizza {
  final int costPerCentimeter = 5;

  Stella(String name, int radius) : super(name: name, radius: radius);

  @override
  double costPizza() {
    return (radius * 2 * costPerCentimeter).toDouble();
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

/*
 Класс PizzaFactory - это фабричный метод. Статичный метод factory возвращает
 экземпляры производных классов , приведенные к интерфейсу базового класса.
 Т.е. создаваемыми Margarita. Mexico, Stella мы будем работать через интерфейс базового класса.

 И в зависимости от того, что находится в PizzaType.exampleName создаётся необходимый 
 экземпляр экласса, приводится к интерфейсу базового класса и возвращается.
*/
class PizzaFactory {
  static Pizza factory(PizzaType pizzaType) {
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
}

void main(List<String> arguments) {
  for (var value in PizzaType.values) {
    // Делаем перебор по всем enum, которые определены в PizzaType
    var pizza = PizzaFactory.factory(
        value); // Закидываем текущее значение enum в шаге итерации в фабричный метод. И создаем экземпляр класса пицца.
    print(pizza.toString() + ' with cost = ' + pizza.costPizza().toString());
  }
}
