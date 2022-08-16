// разные марки, различн. комлектация

/*
Комплектации:
Minimal - Engine, Wheels, Doors, CarBody, CarHeadlights , Seats, Saloon,
Standart - GPS, ABS, Airbags, antiTheftSystem, powerWindows
Maximal - automaticTransmission, climateControl + complete set of airbags;
*/

abstract class BaseAuto {
  late final String name;
}

abstract class MinimalEquipment {
  final double engineVolume;
  final int airbagsNumber;

  MinimalEquipment({required this.engineVolume, required this.airbagsNumber});

  void create();
}

abstract class StandardEquipment {
  final double engineVolume;
  final int airbagsNumber;

  StandardEquipment({required this.engineVolume, required this.airbagsNumber});

  void create();
}

class MercedesMinimalEquipment extends MinimalEquipment with BaseAuto {
  MercedesMinimalEquipment() : super(engineVolume: 1.6, airbagsNumber: 2);

  final String name = 'Mercedes';

  @override
  void create() {
    return print(
        'Created a $name with a Minimum Equipment in which the engine volume - $engineVolume , and $airbagsNumber airbags');
  }
}

class MercedesStandardEquipment extends StandardEquipment with BaseAuto {
  MercedesStandardEquipment() : super(engineVolume: 1.8, airbagsNumber: 4);

  final String name = 'Mercedes';

  @override
  void create() {
    return print(
        'Created a $name with a Standard Equipment in which the engine volume - $engineVolume , and $airbagsNumber airbags');
  }
}

class BugattiMinimalEquipment extends MinimalEquipment with BaseAuto {
  BugattiMinimalEquipment() : super(engineVolume: 1.6, airbagsNumber: 2);

  final String name = 'Bugatti';

  @override
  void create() {
    return print(
        'Created a $name with a Minimum Equipment in which the engine volume - $engineVolume , and $airbagsNumber airbags');
  }
}

class BugattiStandardEquipment extends StandardEquipment with BaseAuto {
  BugattiStandardEquipment() : super(engineVolume: 1.8, airbagsNumber: 4);

  final String name = 'Bugatti';

  @override
  void create() {
    return print(
        'Created a $name with a Standard Equipment in which the engine volume - $engineVolume , and $airbagsNumber airbags');
  }
}

abstract class CarAbstractFactory {
  MinimalEquipment getMinimalEquipment();
  StandardEquipment getStandardEquipment();
}

class MercedesCarFactory implements CarAbstractFactory {
  @override
  MinimalEquipment getMinimalEquipment() {
    return MercedesMinimalEquipment();
  }

  @override
  StandardEquipment getStandardEquipment() {
    return MercedesStandardEquipment();
  }
}

class BugattiCarFactory implements CarAbstractFactory {
  @override
  MinimalEquipment getMinimalEquipment() {
    return BugattiMinimalEquipment();
  }

  @override
  StandardEquipment getStandardEquipment() {
    return BugattiStandardEquipment();
  }
}

enum CarBrands { Mercedes, Bugatti }

class Car {
  final CarAbstractFactory carAbstractFactory;

  Car(this.carAbstractFactory);

  void createCar() {
    var minimalEquipment = carAbstractFactory.getMinimalEquipment()..create();
    var standardEquipment = carAbstractFactory.getStandardEquipment()..create();
  }
}

class CarFactory {
  static CarAbstractFactory factory(CarBrands carBrands) {
    switch (carBrands) {
      case CarBrands.Mercedes:
        return MercedesCarFactory();
      case CarBrands.Bugatti:
        return BugattiCarFactory();
      default:
        throw ArgumentError();
    }
  }
}

void main(List<String> args) {
  // for (var brand in CarBrands.values) {
  var carFactory = CarFactory.factory(CarBrands.Bugatti);
  var car = Car(carFactory);
  car.createCar();

  // for (var brand in CarBrands.values) {
  //   var carFactory = CarFactory.factory(brand);
  //   var car = Car(carFactory).carAbstractFactory.getMinimalEquipment();
  //   car.create();
  // }

  // Car(CarFactory.factory(CarBrands.Mercedes)).createCar(); // Вызов только видов комплектаций у Мерседеса

  // Car(CarFactory.factory(CarBrands.Mercedes))
  //     .carAbstractFactory
  //     .getMinimalEquipment()
  //     .create();
}
