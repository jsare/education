import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:app_weather/models/weather_forecast_daily.dart';
import 'package:app_weather/utilities/forecast_util.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.snapshot}) : super(key: key);

  //Создаём переменную для конструктора виджета
  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    var forecasList = snapshot.data?.list;
    var pressure = forecasList![0].pressure * 0.750062;
    var humidity = forecasList[0].humidity;
    var wind = forecasList[0].speed;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Util.getItem(FontAwesomeIcons.thermometerThreeQuarters,
            pressure.round(), 'mm Hg'),
        Util.getItem(FontAwesomeIcons.cloudRain, humidity, '%'),
        Util.getItem(FontAwesomeIcons.wind, wind.toInt(), 'm/s'),
      ],
    );
  }
}
