// Установить кузов, установить колёса, Установить двигатель, Установить электронику

enum TypesCarBody { Sedan, Coupe, Sport, Hatchback }
enum TypesEngine { Small, Medium, Large, Higher }
enum Electronics { GPS, ABS, AudioSystem, AirConditioner, antiTheftSystem }

class CarBase {
  final TypesCarBody typesCarBody;
  final TypesEngine typesEngine;
  final int numbersOfSeats;

  const CarBase(this.typesCarBody, this.typesEngine, this.numbersOfSeats);

  @override
  String toString() {
    var cardBodyStr = typesCarBody.toString().split('.')[1];
    var typesEngineStr = typesEngine.toString().split('.')[1];
    var numbersOfSeatsStr = numbersOfSeats.toString().split('.');
    return 'The basic equipment consists of $cardBodyStr. Engine: $typesEngineStr & seats $numbersOfSeats. \n';
  }
}

class Car {
  String name;
  CarBase carBase;
  List<Electronics> electronics;
  int buildingTime;

  Car({
    this.name = 'Mercedes',
    this.carBase = const CarBase(TypesCarBody.Sedan, TypesEngine.Medium, 4),
    this.electronics = const <Electronics>[
      Electronics.ABS,
      Electronics.AirConditioner,
      Electronics.GPS,
      Electronics.antiTheftSystem
    ],
    this.buildingTime = 300,
  });

  @override
  String toString() {
    var infoStr = 'Car name: $name \n';
    infoStr += carBase.toString();
    infoStr += 'Electronics: {';
    electronics.forEach((element) {
      infoStr += element.toString().split('.')[1] + ', ';
    });
    infoStr += '} \n';
    infoStr += 'Building time: $buildingTime hourses';
    return infoStr;
  }
}

abstract class Builder {
  void setBase();
  void setElectonics();
  Car getCar();
}

class MercedesCarBuilder implements Builder {
  late Car _car;

  MercedesCarBuilder() {
    _car = Car(name: 'Mercedes', buildingTime: 300);
  }

  @override
  void setBase() {
    _car.carBase = CarBase(TypesCarBody.Coupe, TypesEngine.Higher, 4);
  }

  @override
  void setElectonics() {
    _car.electronics = <Electronics>[
      Electronics.ABS,
      Electronics.AirConditioner,
      Electronics.AudioSystem,
      Electronics.GPS,
      Electronics.antiTheftSystem
    ];
  }

  @override
  Car getCar() {
    return _car;
  }
}

class BugattiCarBuilder implements Builder {
  late Car _car;

  BugattiCarBuilder() {
    _car = Car(name: 'Bigatti', buildingTime: 450);
  }

  @override
  void setBase() {
    _car.carBase = CarBase(TypesCarBody.Sport, TypesEngine.Higher, 2);
  }

  @override
  void setElectonics() {
    _car.electronics = <Electronics>[
      Electronics.GPS,
      Electronics.AirConditioner,
      Electronics.antiTheftSystem
    ];
  }

  @override
  Car getCar() {
    return _car;
  }
}

class Director {
  Builder? _builder;

  Director([this._builder]);

  set builder(Builder builder) => _builder = builder;

  void createCar() {
    assert(_builder != null, 'WTF?');
    _builder?.setBase();
    _builder?.setElectonics();
  }
}

void main(List<String> args) {
  var director = Director();

  for (var it in <Builder>[MercedesCarBuilder(), BugattiCarBuilder()]) {
    director._builder = it;
    director.createCar();
    print(it.getCar());
    print('---' * 20);
  }
}
