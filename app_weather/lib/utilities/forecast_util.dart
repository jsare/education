import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Класс будет содержать метод, который будет форматировать дату пришедшую с JSON.
class Util {
  // Создаём метод getFormattedDate, который возвращает String и принимать аргмумент dateTime типа DateTime.
  static String getFormattedDate(DateTime dateTime) {
    // Возвращать будем форматированную дату.
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }

  static getItem(IconData iconData, int value, String units) {
    return Column(
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.black87,
          size: 28.0,
        ),
        const SizedBox(height: 10),
        Text(
          '$value',
          style: const TextStyle(fontSize: 20.0, color: Colors.black87),
        ),
        const SizedBox(height: 10),
        Text(units,
            style: const TextStyle(fontSize: 15.0, color: Colors.black87)),
      ],
    );
  }
}
