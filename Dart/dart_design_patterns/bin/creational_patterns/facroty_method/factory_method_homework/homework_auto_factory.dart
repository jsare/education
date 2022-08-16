enum AutoType { Minimal, Middle, Maximal }

abstract class Auto {
  final String? name;
  final double? volumeEngine;

  Auto({this.name, this.volumeEngine});

  factory Auto.factory(AutoType autoType) {
    switch (autoType) {
      case AutoType.Minimal:
        return Minimal();
      case AutoType.Middle:
        return Middle();
      case AutoType.Maximal:
        return Maximal();
      default:
        throw ArgumentError();
    }
  }
}

class Minimal implements Auto {
  @override
  String get name => 'Minimal';

  @override
  double get volumeEngine => 1.6;

  @override
  String toString() {
    return '$name : $volumeEngine';
  }
}

class Middle implements Auto {
  @override
  String get name => 'Middle';

  @override
  double get volumeEngine => 1.8;

  @override
  String toString() {
    return '$name : $volumeEngine';
  }
}

class Maximal implements Auto {
  @override
  String get name => 'Maximal';

  @override
  double get volumeEngine => 2.0;

  @override
  String toString() {
    return '$name : $volumeEngine';
  }
}

void main(List<String> args) {
  for (var value in AutoType.values) {
    var auto = Auto.factory(value);
    print(auto.toString());
  }
}
