import 'dart:developer';
import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

// Создаём метод, getCurrentLocation который возвращает Futures типа void.
  Future<void> getCurrentLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      log('Something goes wrong: $e');
    }
  }
}

// После реализации Location , нужно выполнить запросы к сайту openweathermap по геолокации,
// для этого переходим к API
