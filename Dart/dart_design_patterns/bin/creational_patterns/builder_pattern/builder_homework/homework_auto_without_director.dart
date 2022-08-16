import '../builder_homework/homework_auto_with_director.dart'
    show CarBase, TypesCarBody, TypesEngine, Electronics;

class CarBuilder {
  String _name = '';
  CarBase _carBase = const CarBase(TypesCarBody.Coupe, TypesEngine.Large, 2);
  List<Electronics> _electronics = <Electronics>[
    Electronics.ABS,
    Electronics.AirConditioner,
  ];
  int _buildingTime = 280;

  List<Electronics> get electronics => _electronics;
  CarBase get carBase => _carBase;
  String get name => _name;
  int get buildingTime => _buildingTime;

  void setName(String name) => _name = name;
  void setCarBase(CarBase carBase) => _carBase = carBase;
  void setElectronics(List<Electronics> electronics) =>
      _electronics = electronics;
  void setBuildingTime(int buildingTime) => _buildingTime = buildingTime;

  Car build() => Car(this);
}

class Car {
  late final String name;
  late final CarBase carBase;
  late final List<Electronics> electronics;
  late final int buildingTime;

  Car(CarBuilder builder) {
    name = builder.name;
    carBase = builder.carBase;
    electronics = builder.electronics;
    buildingTime = builder.buildingTime;
  }

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

  static CarBuilder get builder => CarBuilder();
}

void main(List<String> args) {
  var carBuilder = Car.builder;

  carBuilder
    ..setName('Volvo')
    ..setCarBase(CarBase(TypesCarBody.Hatchback, TypesEngine.Large, 4))
    ..setElectronics(
        <Electronics>[Electronics.GPS, Electronics.antiTheftSystem])
    ..setBuildingTime(250);

  var volvo = carBuilder.build();
  print(volvo);
}
