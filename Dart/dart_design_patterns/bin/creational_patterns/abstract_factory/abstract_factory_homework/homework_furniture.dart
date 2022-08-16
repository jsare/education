// // 3 вида мебели и 3 вида фабрики

// abstract class Chair {
//   final String name;
// }

abstract class Chair {
  final String name;

  Chair(this.name);

  void create();
}

abstract class CoffeeTable {
  final String name;

  CoffeeTable(this.name);

  void create();
}

abstract class Sofa {
  final String name;

  Sofa(this.name);

  void create();
}

class VictorianChair implements Chair {
  @override
  String get name => 'Викторианское кресло.';

  @override
  void create() {
    print('Было создано $name');
  }
}

class ModernChair implements Chair {
  @override
  void create() {
    print('Было создано $name');
  }

  @override
  String get name => 'Кресло Модерн.';
}

class ArDecoChair implements Chair {
  @override
  void create() {
    print('Было создано $name');
  }

  @override
  String get name => 'Кресло Ар-Деко.';
}

class VictorianCoffeeTable implements CoffeeTable {
  @override
  void create() {
    print('Было создано $name');
  }

  @override
  String get name => 'Викторианский Кофейный столик';
}

class ModernCoffeeTable implements CoffeeTable {
  @override
  void create() {
    print('Было создано $name');
  }

  @override
  String get name => 'Кофейный столик Модерн.';
}

class ArDecoCoffeeTable implements CoffeeTable {
  @override
  void create() {
    print('Было создано $name');
  }

  @override
  String get name => 'Кофейный столик Ар-Деко';
}

class VictorianSofa implements Sofa {
  @override
  void create() {
    print('Было создано $name');
  }

  @override
  String get name => 'Викторианский Диван.';
}

class ModernSofa implements Sofa {
  @override
  void create() {
    print('Было создано $name');
  }

  @override
  String get name => 'Диван Модерн.';
}

class ArDecoSofa implements Sofa {
  @override
  void create() {
    print('Было создано $name');
  }

  @override
  String get name => 'Диван Ар-Деко';
}

enum TypeStyle { Victorian, Modern, ArDeco }

abstract class FurnitureAbstractFactory {
  factory FurnitureAbstractFactory(TypeStyle typeStyle) {
    switch (typeStyle) {
      case TypeStyle.Victorian:
        return VictorianFurnitureFactory();
      case TypeStyle.Modern:
        return ModernFurnitureFactory();
      case TypeStyle.ArDeco:
        return ArDecoFurnitureFactory();
      default:
        throw ArgumentError();
    }
  }

  Chair getChar();
  CoffeeTable getCoffeTable();
  Sofa getSofa();
}

class VictorianFurnitureFactory implements FurnitureAbstractFactory {
  @override
  Chair getChar() {
    return VictorianChair();
  }

  @override
  CoffeeTable getCoffeTable() {
    return VictorianCoffeeTable();
  }

  @override
  Sofa getSofa() {
    return VictorianSofa();
  }
}

class ModernFurnitureFactory implements FurnitureAbstractFactory {
  @override
  Chair getChar() {
    return ModernChair();
  }

  @override
  CoffeeTable getCoffeTable() {
    return ModernCoffeeTable();
  }

  @override
  Sofa getSofa() {
    return ModernSofa();
  }
}

class ArDecoFurnitureFactory implements FurnitureAbstractFactory {
  @override
  Chair getChar() {
    return ArDecoChair();
  }

  @override
  CoffeeTable getCoffeTable() {
    return ArDecoCoffeeTable();
  }

  @override
  Sofa getSofa() {
    return ArDecoSofa();
  }
}

class Factory {
  final FurnitureAbstractFactory furnitureAbstractFactory;

  Factory(this.furnitureAbstractFactory);

  void createFurniture() {
    var chair = furnitureAbstractFactory.getChar()..create();
    var coffeTable = furnitureAbstractFactory.getCoffeTable()..create();
    var sofa = furnitureAbstractFactory.getSofa()..create();
  }
}

void main(List<String> args) {
  // Cпособ вызова всех элементов одной фабрики.
  var typeStyle = TypeStyle.ArDeco;
  var factory = Factory(FurnitureAbstractFactory(typeStyle));
  factory.createFurniture();

  //Способ вызова конкретного элемента одной фабрики.
  // Factory(FurnitureAbstractFactory(TypeStyle.ArDeco))
  //     .furnitureAbstractFactory
  //     .getChar()
  //     .create();
}
