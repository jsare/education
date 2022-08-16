import 'package:app_weather/models/weather_forecast_daily.dart';
import 'package:flutter/material.dart';

class TempView extends StatelessWidget {
  const TempView({Key? key, required this.snapshot}) : super(key: key);

  // Создаём переменную snapshot.
  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var icon = forecastList?[0].getIconUrl();
    var temp = forecastList?[0].temp.day.toStringAsFixed(0);
    var description = forecastList?[0].weather[0].description.toUpperCase();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(
          icon!,
          scale: 0.4,
          color: Colors.black87,
        ),
        const SizedBox(width: 20),
        Column(
          children: <Widget>[
            Text(
              '$temp °C',
              style: const TextStyle(fontSize: 54, color: Colors.black87),
            ),
            Text(
              '$description',
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.black87,
              ),
            ),
          ],
        )
      ],
    );
  }
}
