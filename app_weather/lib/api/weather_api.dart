import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:app_weather/models/weather_forecast_daily.dart';
import 'package:app_weather/utilities/constants.dart';
import 'package:app_weather/utilities/location.dart';

// Класс WeatherAPI будет получать get-запрос
class WeatherApi {
  /*
  Создаём метод, который будет получать запрос по названию города.
  Метод fecthWeatherForecastWithCity будет возвращать Future c типом WeatherForecast,
  который в качестве пораметра будет принимать cityName типа String
  */

/* После создания location, реализуем запрос к сайту. И чтобы не создавать новый метод, редактируем уже имеющийся.
  Добавляем к методу необязательный параметр isCity с типом bool, т.е. когда
  Мы будем получать погоду по названию города, то этот параметр будем ставить в значении true
  Таким образом мы будем передавать запрос с параметром города, а иначе с параметрами lat и lon
*/
  Future<WeatherForecast> fetchWeatherForecast(
      {String? city, bool? isCity}) async {
    // В начале нам необходимо получить локацию
    Location location = Location();
    await location.getCurrentLocation();

    // Создадим вспомогательную переменную
    Map<String, String?> parameters;

    // Реализовываем условие
    if (isCity = true) {
      // Создаём переменную queryParameters, которая принимает запросы.
      var queryParameters = {
        'appid': Constants.weatherAppID,
        'units': 'metric',
        'q': city,
      };
      parameters = queryParameters;
    } else {
      var queryParameters = {
        'appid': Constants.weatherAppID,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lot': location.longitude.toString(),
      };
      parameters = queryParameters;
    }

    // После подготовки запроса, нужно сформировать полный URL запроса.
    var uri = Uri.https(Constants.weatherBaseURLDomen,
        Constants.weatherForecastPath, parameters);

    // Создаём log(), для вывода в терминал наш запрос. Т.с. мы посмотрим как он выглядит.
    log('request: ${uri.toString()}');

    // Далее необходимо выполнить запрос. Выполняем его используя .get - метод.
    var response = await http.get(uri);

    //Когда мы получаем результат, то выводим его в консоль.
    log('response: ${response.body}');

    if (response.statusCode == 200) {
      // Если поучаем статус кода 200, то парсим нашу модель. Чтобы это сделать,
      // нужно обратиться к нашей модели WeatherForecast и вызвать метод .fromJson().
      // Когда мы получаем json, его нужно декодировать и передать response.body
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
