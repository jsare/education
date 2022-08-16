// Различные типы перечислений
enum PizzaDoughDepth { thin, thick } // Толщина теста
enum PizzaDoughType { wheat, corn, rye } // Тип теста(мука)
enum PizzaSauceType { pesto, whiteGarLic, barbeque, tomato } // Соусы
enum PizzaTopLevelType {
  mozzarella,
  salami,
  bacon,
  mushrooms,
  shrimps
} // Топпинги

// Класс - Основа для пиццы. В котором задаётся толстая корочка, тонкая
class PizzaBase {
  final PizzaDoughDepth doughDept; // Толщина теста
  final PizzaDoughType doughType; // Тип теста

  const PizzaBase(this.doughDept, this.doughType);

// Пеоеопределение метода toString, чтобы можно было нормально выводить в терминал.
  @override
  String toString() {
    var depthStr = doughDept.toString().split('.')[1];
    var doughTypeStr = doughType.toString().split('.')[1];
    return 'dough type: $doughTypeStr & $depthStr \n';
  }
}

// Основной класс Pizza - в соотношении со структорой Builder - это Product.
class Pizza {
  String name;
  PizzaBase dough;
  PizzaSauceType sauce;
  int cookingTime;
  List<PizzaTopLevelType> topping;

// Параметры по умолчанию
  Pizza(
      {this.name = 'Brick',
      this.dough = const PizzaBase(PizzaDoughDepth.thin, PizzaDoughType.wheat),
      this.sauce = PizzaSauceType.barbeque,
      this.cookingTime = 10,
      this.topping = const <PizzaTopLevelType>[
        PizzaTopLevelType.bacon,
        PizzaTopLevelType.mozzarella
      ]});

// Переопределение метода toString, чтобы посмотреть в консоле из каких ингридиентов состоит пицца.
  @override
  String toString() {
    var infoStr = 'Pizza name: $name \n'; // Имя пиццы
    infoStr += dough.toString(); // Основа для пиццы
    infoStr +=
        'sauce type: ${sauce.toString().split('.')[1]}\n'; // Какой соус был нанесён
    infoStr += 'topping: {'; // Что было в Топпинге
    topping.forEach((element) {
      infoStr += element.toString().split('.')[1] + ', ';
    });
    infoStr += '}\n';
    infoStr += 'cooking time: $cookingTime minutes'; // Время приготовления
    return infoStr;
  }
}

// Builder abstract class - Задаём интерфейс билдера
abstract class Builder {
  void prepareDough();
  void addSauce();
  void addTopping();
  Pizza getPizza();
}

/*
Для каждой пиццы, реализуем интерфейс Builder.
Создаём класс - MargaritaPizzaBuilder, который реализует интерфейс Builder
*/
class MargaritaPizzaBuilder implements Builder {
  // Создаём приватную переменную _pizza, которая возвращает экземпляр класс Pizza.
  late Pizza _pizza;

  MargaritaPizzaBuilder() {
// У MargaritaPizzaBiulder создаём экземпляр класса Pizza, в который закидываем пару аргументов
    _pizza = Pizza(name: 'Margarita', cookingTime: 15);
  }

// В методе добавитьСоус мы указываем, что соус будет Томатный.
  @override
  void addSauce() {
    _pizza.sauce = PizzaSauceType.tomato;
  }

// Добавляем топпинг
  @override
  void addTopping() {
    _pizza.topping = const <PizzaTopLevelType>[
      PizzaTopLevelType.bacon,
      PizzaTopLevelType.mozzarella,
      PizzaTopLevelType.mozzarella
    ];
  }

// Для подготовки теста вызываем переменную _pizza со свойством .dough, где присваиваем PizzaBase и зада>м аргументы.
  @override
  void prepareDough() {
    _pizza.dough = const PizzaBase(PizzaDoughDepth.thick, PizzaDoughType.wheat);
  }

// Возвращается сконструированный экземпляр класса Pizza.
  @override
  Pizza getPizza() {
    return _pizza; // Возвращается сконструированный класс Pizza
  }
}

class SalamiPizzaBuilder implements Builder {
  late Pizza _pizza;

  SalamiPizzaBuilder() {
    _pizza = Pizza(name: 'Salami', cookingTime: 10);
  }

  @override
  void addSauce() {
    _pizza.sauce = PizzaSauceType.barbeque;
  }

  @override
  void addTopping() {
    _pizza.topping = const <PizzaTopLevelType>[
      PizzaTopLevelType.salami,
      PizzaTopLevelType.mozzarella
    ];
  }

  @override
  void prepareDough() {
    _pizza.dough = const PizzaBase(PizzaDoughDepth.thin, PizzaDoughType.rye);
  }

  @override
  Pizza getPizza() {
    return _pizza;
  }
}

// Создаём класс Директор, в который передаём класс Builder? с переменной _builder и делаем его приватным.
class Director {
  Builder? _builder;

  Director([this._builder]);

  set builder(Builder builder) => _builder = builder;

  void makePizza() {
    assert(_builder != null, 'Oo');
    _builder?.prepareDough();
    _builder?.addSauce();
    _builder?.addTopping();
  }
}

void main(List<String> args) {
  var director =
      Director(); // Создаём переменную director и присваиваем ей экземпляр класса Director.

  // Делаем итерацию по списку из 2-х экземпляров классов, которые приводятся к интерфейсу билдера
  for (var it in <Builder>[MargaritaPizzaBuilder(), SalamiPizzaBuilder()]) {
    director.builder = it; // Для Director устанавливаем текущий билдер
    director.makePizza();
    print(it.getPizza());
    print('---' * 20);
  }
}
