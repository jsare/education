import 'package:flutter/material.dart';

import 'package:app_weather/models/weather_forecast_daily.dart';
import 'package:app_weather/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  // Т.к. мы работаем со snapshot у FutureBuilder, то в констрктор CItiView будем передавать snapshot.
  final AsyncSnapshot<WeatherForecast> snapshot;
  const CityView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Реализуем переменную forecastList, в которой мы получаем путь к дате через snapshot.
    var forecastList = snapshot.data?.list;
    var city = snapshot.data?.city.name;
    // Реализуем переменные city и country, обращаясь к snapshot.
    var country = snapshot.data?.city.country;
    /*
    Реализуем переменную для класса Util - formattedDate и присваиваем ей значение экзмепляра класса DateTime
    с методом .fromMillisecondsSinceEpoch(), после чего опрокидываем нашу переменную,
    которая содержит дату forecasList[0] и обращаемся у св-ву .dt и * 1000. 
    */
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt * 1000);

    return Column(
      children: <Widget>[
        // Мы получаем city и country. Далее мы должны реализовать эти переменные.
        Text(
          '$city, $country',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            color: Colors.black87,
          ),
        ),
        // Выводим текущую дату. Создав в папке Utilities новый файл и класс forecast_util.
        Text(
          // Подключаем класс Util с методом .getFormattedDate и переменной formattedDate.
          // Далее реализовываем эту переменную.
          Util.getFormattedDate(formattedDate),
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
