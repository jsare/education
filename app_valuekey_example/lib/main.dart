import 'package:flutter/material.dart';

import 'value_key_example_1.dart';
import 'value_key_example_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ValueKeyExample2(),
    );
  }
}
