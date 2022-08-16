abstract class Latte {
  final String name;
  final String variety;

  Latte(this.name, this.variety);

  void preparation();
}

abstract class Cappuccino {
  final String name;
  final String variety;

  Cappuccino(this.name, this.variety);

  void preparation();
}

abstract class Espresso {
  final String name;
  final String variety;

  Espresso(this.name, this.variety);

  void preparation();
}

abstract class Raf {
  final String name;
  final String variety;

  Raf(this.name, this.variety);

  void preparation();
}

class ArabicLatte extends Latte {
  ArabicLatte() : super('Latte', 'Arabica');

  @override
  void preparation() {
    print('Preparation of $name from $variety beans');
  }
}

class ArabicCappuccino extends Cappuccino {
  ArabicCappuccino() : super('Cappuccino', 'Arabica');

  @override
  void preparation() {
    print('Preparation of $name from $variety beans');
  }
}

class ArabicEspresso extends Espresso {
  ArabicEspresso() : super('Espresso', 'Arabica');

  @override
  void preparation() {
    print('Preparation of $name from $variety beans');
  }
}

class ArabicRaf extends Raf {
  ArabicRaf() : super('Raf', 'Arabica');

  @override
  void preparation() {
    print('Preparation of $name from $variety beans');
  }
}

class RobustaLatte extends Latte {
  RobustaLatte() : super('Latte', 'Robusta');

  @override
  void preparation() {
    print('Preparation of $name from $variety beans');
  }
}

class RobustaCappuccino extends Cappuccino {
  RobustaCappuccino() : super('Cappuccino', 'Robusta');

  @override
  void preparation() {
    print('Preparation of $name from $variety beans');
  }
}

class RobustaEspresso extends Espresso {
  RobustaEspresso() : super('Espresso', 'Robusta');

  @override
  void preparation() {
    print('Preparation of $name from $variety beans');
  }
}

class RobustaRaf extends Raf {
  RobustaRaf() : super('Raf', 'Robusta');

  @override
  void preparation() {
    print('Preparation of $name from $variety beans');
  }
}

abstract class SetAbstractFactory {
  Latte getLatte();
  Cappuccino getCapuccino();
  Espresso getEspresso();
  Raf getRaf();
}

class ArabicVarietyFactory implements SetAbstractFactory {
  @override
  Latte getLatte() {
    return ArabicLatte();
  }

  @override
  Cappuccino getCapuccino() {
    return ArabicCappuccino();
  }

  @override
  Espresso getEspresso() {
    return ArabicEspresso();
  }

  @override
  Raf getRaf() {
    return ArabicRaf();
  }
}

class RobustaVarietyFactory implements SetAbstractFactory {
  @override
  Latte getLatte() {
    return RobustaLatte();
  }

  @override
  Cappuccino getCapuccino() {
    return RobustaCappuccino();
  }

  @override
  Espresso getEspresso() {
    return RobustaEspresso();
  }

  @override
  Raf getRaf() {
    return RobustaRaf();
  }
}

enum VarietyCoffee { Arabica, Robusta }

class Order {
  final SetAbstractFactory setAbstractFactory;

  Order(this.setAbstractFactory);

  void prepareSet() {
    var preparedLatte = setAbstractFactory.getLatte()..preparation();
    var preparedCappuccino = setAbstractFactory.getCapuccino()..preparation();
    var preparedEspresso = setAbstractFactory.getEspresso()..preparation();
    var preparedRaf = setAbstractFactory.getRaf()..preparation();
  }
}

class SetFactory {
  static SetAbstractFactory factory(VarietyCoffee varietyCoffee) {
    switch (varietyCoffee) {
      case VarietyCoffee.Arabica:
        return ArabicVarietyFactory();
      case VarietyCoffee.Robusta:
        return RobustaVarietyFactory();
      default:
        throw ArgumentError();
    }
  }
}

void main(List<String> args) {
  var varietyCoffee = VarietyCoffee.Arabica;
  var setCoffee = SetFactory.factory(varietyCoffee);
  var order = Order(setCoffee);
  order.prepareSet();
}
