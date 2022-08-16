import '../../builder_pattern/builder_learn/builder_with_director.dart'
    show
        PizzaBase,
        PizzaDoughDepth,
        PizzaDoughType,
        PizzaSauceType,
        PizzaTopLevelType;

class PizzaSingleTon {
  static PizzaSingleTon? _instance;

  String name = 'Brick';
  PizzaBase dough =
      const PizzaBase(PizzaDoughDepth.thick, PizzaDoughType.wheat);
  PizzaSauceType sauce = PizzaSauceType.barbeque;
  int cookingTime = 10;
  List<PizzaTopLevelType> topping = <PizzaTopLevelType>[
    PizzaTopLevelType.bacon,
    PizzaTopLevelType.mozzarella
  ];

  PizzaSingleTon._();

  factory PizzaSingleTon() {
    return _instance ??= PizzaSingleTon._();
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
}

void main(List<String> args) {
  var pizza = PizzaSingleTon();
  print(pizza);

  print('---' * 20);

  pizza.name = 'O_O';
  var newPizza = PizzaSingleTon();
  print(identical(pizza, newPizza));
  print('---' * 20);
  print(newPizza);
}
