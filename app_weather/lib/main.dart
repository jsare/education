// API Keys - 1369dd6b5ae78fc9952261ab9aa236b4
import 'package:app_weather/screens/location_screen.dart';
import 'package:flutter/material.dart';

// import 'package:app_weather/screens/wether_forecast_screen.dart';
// import 'package:app_weather/models/weather_forecast_daily.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: LocationScreen(),
    );
  }
}
