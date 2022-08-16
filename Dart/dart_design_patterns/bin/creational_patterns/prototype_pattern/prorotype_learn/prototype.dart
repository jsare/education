import '../../builder_pattern/builder_learn/builder_with_director.dart'
    show
        PizzaBase,
        PizzaDoughDepth,
        PizzaDoughType,
        PizzaSauceType,
        PizzaTopLevelType;

abstract class IPrototype {
  Pizza clone();
}

//Product class
class Pizza implements IPrototype {
  String name;
  PizzaBase dough;
  PizzaSauceType sauce;
  int cookingTime;
  List<PizzaTopLevelType> topping;

  Pizza(
      {this.name = 'Brick',
      this.dough = const PizzaBase(PizzaDoughDepth.thin, PizzaDoughType.wheat),
      this.sauce = PizzaSauceType.barbeque,
      this.cookingTime = 10,
      required this.topping});

  factory Pizza._fromPizza(Pizza pizza) {
    return Pizza(
      name: pizza.name,
      dough: PizzaBase(pizza.dough.doughDept, pizza.dough.doughType),
      sauce: pizza.sauce,
      // topping: pizza.topping,
      topping: [...pizza.topping],
    );
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

  @override
  Pizza clone() {
    return Pizza._fromPizza(this);
  }
}

void main(List<String> args) {
  var pizza = Pizza(topping: <PizzaTopLevelType>[
    PizzaTopLevelType.bacon,
    PizzaTopLevelType.mozzarella
  ]);
  print(pizza);
  print('---' * 8 + 'New' + '---' * 8);
  var newPizza = pizza.clone();
  newPizza.topping.add(PizzaTopLevelType.mushrooms);
  print(newPizza);
  print('---' * 8 + 'Old' + '---' * 8);
  print(pizza);
}
