// разные марки, различн. комлектация

abstract class StandardEquipment {
  void create();
}

class MercedesStandardEquipment implements StandardEquipment {
  @override
  void create() {
    print('Created Mercedes car with standard equipment');
  }
}

class BugattiStandardEquipment implements StandardEquipment {
  @override
  void create() {
    print('Created Bugatti car with standard equipment');
  }
}

abstract class MinimalEquipment {
  void create();
}

class MercedesMinimalEquipment implements MinimalEquipment {
  @override
  void create() {
    print('Created Mercedes car with minimal equipment');
  }
}

class BugattiMinimalEquipment implements MinimalEquipment {
  @override
  void create() {
    print('Created Bugatti car with minimal equipment');
  }
}

abstract class BrandFactory {
  MinimalEquipment createMin();
  StandardEquipment createStd();
}

class MercedesCarFactory implements BrandFactory {
  @override
  MinimalEquipment createMin() {
    return MercedesMinimalEquipment();
  }

  @override
  StandardEquipment createStd() {
    return MercedesStandardEquipment();
  }
}

class BugattiCarFactory implements BrandFactory {
  @override
  MinimalEquipment createMin() {
    return BugattiMinimalEquipment();
  }

  @override
  StandardEquipment createStd() {
    return BugattiStandardEquipment();
  }
}

class SomeCar {
  final BrandFactory brandFactory;
  late final StandardEquipment equipment;

  SomeCar(this.brandFactory);

  void setEquipment() {
    this.equipment = brandFactory.createStd();
  }

  void create() {
    this.equipment.create();
  }
}

void main(List<String> args) {
  var brand = BugattiCarFactory();
  var car = SomeCar(brand);

  car.setEquipment();
  car.create();
}
