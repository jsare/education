import 'dart:developer';

import 'package:app_weather/api/weather_api.dart';
import 'package:app_weather/screens/wether_forecast_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getLocationData() async {
    try {
      var weatherInfo = await WeatherApi().fetchWeatherForecast();

      // После того, как мы получаем нашу локацию, то переходим на экран с погодой
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WeatherForecastScreen(locationWeather: weatherInfo);
      }));
    } catch (e) {
      log('$e');
    }
  }
  // Далее передаём информацию о погоде на WeatherForecastScreen(), нужно создать переменную и добавить её в конструктор.

  // Вызываем метод getLocationData в методе initState
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

// Пока определяется локация, мы будем показывать индикатор закгрузки
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black87,
          size: 100.0,
        ),
      ),
    );
  }
}
