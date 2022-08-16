enum TypesLogistics { RoadLogistics, SeaLogistics }
// enum

abstract class Logistics {
  Transport createTransport();
  factory Logistics(TypesLogistics typesLogistics) {
    switch (typesLogistics) {
      case TypesLogistics.RoadLogistics:
        return RoadLogistics();
      case TypesLogistics.SeaLogistics:
        return SeaLogistics();
      default:
        throw ArgumentError();
    }
  }
}

class RoadLogistics implements Logistics {
  @override
  Transport createTransport() {
    return Truck();
  }
}

class SeaLogistics implements Logistics {
  @override
  Transport createTransport() {
    return Ship();
  }
}

abstract class Transport {
  final String name = '';
  String deliver();
}

class Truck implements Transport {
  @override
  String get name => 'Грузовик';

  @override
  String deliver() {
    return 'Доставить грузовиком по суше';
  }
}

class Ship implements Transport {
  @override
  String deliver() {
    return 'Доставить на судне по морю';
  }

  @override
  String get name => 'Судно';
}

void main(List<String> args) {
  for (var value in TypesLogistics.values) {
    var logistics = Logistics(value);
    print(logistics.createTransport().name +
        ' - ' +
        logistics.createTransport().deliver());
  }
}
