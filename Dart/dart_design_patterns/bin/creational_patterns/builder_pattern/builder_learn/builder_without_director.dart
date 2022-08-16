// Чтобы не писать лишний код6 ипортируем часть функциональности из предыдущего файла
import 'builder_with_director.dart'
    show
        PizzaBase,
        PizzaDoughDepth,
        PizzaDoughType,
        PizzaSauceType,
        PizzaTopLevelType;

// Зводим класс PizzaBuilder, в котором заводим поля и сразу их инифиализируем некими значениями.
// Условно говоря, пицца по умолчанию.
class PizzaBuilder {
  String _name = '';
  PizzaBase _dough =
      const PizzaBase(PizzaDoughDepth.thin, PizzaDoughType.wheat);
  PizzaSauceType _sauce = PizzaSauceType.barbeque;
  int _cookingTime = 10;
  List<PizzaTopLevelType> _topping = const <PizzaTopLevelType>[
    PizzaTopLevelType.bacon,
    PizzaTopLevelType.mozzarella
  ];

// Далее заводим методы для установки этих значений и установки этих параметров.
  List<PizzaTopLevelType> get topping => _topping;
  int get cookingTime => _cookingTime;
  PizzaSauceType get sauce => _sauce;
  PizzaBase get dough => _dough;
  String get name => _name;

  void setTopping(List<PizzaTopLevelType> topping) => _topping = topping;
  void setName(String name) => _name = name;
  void setCookingTime(int cookingTime) => _cookingTime = cookingTime;
  void setSauce(PizzaSauceType sauce) => _sauce = sauce;
  void setDough(PizzaBase dough) => _dough = dough;

  Pizza build() =>
      Pizza(this); // В пиццу мы передаём конструктор экземпляра PizzaBuilder
}

//Product class - У Pizza нет каких-либо параметров, поля класса чётко объйвлены.
class Pizza {
  late final String name;
  late final PizzaBase dough;
  late final PizzaSauceType sauce;
  late final int cookingTime;
  late final List<PizzaTopLevelType> topping;

  // Есть один конструктор, на вход которого подаётся PizzaBuilder, в следствии чего начинаем инициализацию.
  // Все св-ва берутся из builder.
  Pizza(PizzaBuilder builder) {
    name = builder.name;
    dough = builder.dough;
    sauce = builder.sauce;
    cookingTime = builder.cookingTime;
    topping = builder.topping;
  }

  @override
  String toString() {
    var infoStr = 'Pizza name: $name \n';
    infoStr += dough.toString();
    infoStr += 'sauce type: ${sauce.toString().split('.')[1]} \n';
    infoStr += 'topping: {';
    topping.forEach((element) {
      infoStr += element.toString().split('.')[1] + ', ';
    });
    infoStr += '}\n';
    infoStr += 'cooking time: $cookingTime minutes';
    return infoStr;
  }

// Создаётся статический метод билдер, который возвращает экземляр класса билдер, через который впоследствии будет осуществляться компоновка создаваемых экземпляров классов Pizza.
  static PizzaBuilder get builder => PizzaBuilder();
}

void main(List<String> args) {
  // Создаем экземпляр класса PizzaBuilder(), вызывая статический метод get builder и присваиваем его переменной pizzaBuilder.
  var pizzaBuilder = Pizza.builder;

  //Способ 1
  pizzaBuilder
    ..setName('Margarita')
    ..setDough(PizzaBase(PizzaDoughDepth.thick, PizzaDoughType.wheat))
    ..setSauce(PizzaSauceType.tomato)
    ..setCookingTime(15)
    ..setTopping(<PizzaTopLevelType>[
      PizzaTopLevelType.bacon,
      PizzaTopLevelType.mozzarella,
      PizzaTopLevelType.mozzarella
    ]);
  var margarita = pizzaBuilder.build();
  print(margarita);

  print('---' * 20);

  //Способ 2

  pizzaBuilder
    ..setName('Salami')
    ..setDough(PizzaBase(PizzaDoughDepth.thin, PizzaDoughType.rye))
    ..setSauce(PizzaSauceType.barbeque)
    ..setCookingTime(15)
    ..setTopping(<PizzaTopLevelType>[
      PizzaTopLevelType.bacon,
      PizzaTopLevelType.mozzarella,
    ]);
  var salami = Pizza(pizzaBuilder);
  print(salami);

  print('---' * 20);

  // Способ 2.1
  /*
  Создаём newSalami, вся инициализация проводится в скобках. Вернется проиниц. нужными параметрами pizzaBuilder, потом вызываем метод build.
  */

  var newSalami = (pizzaBuilder
        ..setName('Mega Salami')
        ..setDough(PizzaBase(PizzaDoughDepth.thick, PizzaDoughType.rye))
        ..setSauce(PizzaSauceType.barbeque)
        ..setCookingTime(10)
        ..setTopping(<PizzaTopLevelType>[
          PizzaTopLevelType.salami,
          PizzaTopLevelType.salami,
          PizzaTopLevelType.salami,
          PizzaTopLevelType.salami,
          PizzaTopLevelType.mozzarella
        ]))
      .build();
  print(newSalami);
}
