// import 'dart:convert';
// import 'package:characters/characters.dart';

// ignore_for_file: unused_element

/* 
-----------
-- Получение числа из строки --
-----------
*/

// void main(List<String> arguments) { // Получение числа из строки
//   var d = int.parse('4');
//   print(d);
// }

/* 
-----------
-- Циклы --
-----------
*/

// void main() { // Standard cycle (Стандартный цикл)
//   var result = 0;
//   for (var index = 1; index <= 6; index++) {
//     result += index;
//   }
//   print(result);
// }

// void main() {
//   final listOfChar = ['a', 'b', 'c', 'd', 'f', 'g'];

//   for (var index = 0; index < 6; index += 1) {
//     print(listOfChar[index]);
//   }
// }

// --Or you can do it like this--

// void main() {
//   final listOfChar = ['a', 'b', 'c', 'd', 'f', 'g'];

//   var i = 0;
//   for (final element in listOfChar.asMap().entries) {
//     print('${element.key} ${element.value}');
//   }

// for (var index = 0; index < listOfChar.length; index += 1) {
//   print('$index: ${listOfChar[index]}'); // Выводит массив, пока индекс меньше длины.
// }
// }

/* 
-----------
-- Классы --
-----------
*/

// class Employe {
//   String name;
//   final String surname;
//   final String passport;
//   final int age;
//   final List<int> salary;

//   Employe(this.name, this.surname, this.passport, this.age, this.salary);
// }

// void main() {
//   final ss = 'asdfjdkfj';
//   final ii = '5';
//   final one = Employe(
//     'Ivan',
//     'Ivanov',
//     '0101 334455',
//     45,
//     [1000, 1000, 1000, 1000, 1500, 1500, 2000, 2000, 2000, 2000, 2000, 2000],
//   );

//   final two = Employe(
//     'Kuzma',
//     'Kuzmin',
//     '0101 334466',
//     21,
//     [1000, 1000, 1000, 1000, 1500, 1500, 2000, 2000, 2000, 2000, 2000, 2000],
//   );

//   final list = [one, two];

// print(ss);
// print(ii);
// print(one);
// print(two);

// print(one.name);
// one.name = 'hjhjhj';
// print(one.name);
// }

/* 
-----------
-- Классы: Скрыте интерфейсы / Implements --
-----------
*/

// abstract class Identifirable {
//   final int id;

//   Identifirable(this.id);
// }

// abstract class Posudable {
//   void put();
//   void fill();
// }

// abstract class WeghtTable {
//   final double weight;

//   WeghtTable(this.weight);
// }

// class Cup implements WeghtTable, Posudable, Identifirable {
//   final double weight;
//   final int id;
//   Cup(this.id, this.weight);

//   @override
//   void put() {
//     print('put cup');
//   }

//   @override
//   void fill() {
//     print('fill cup');
//   }
// }

// class Plate implements WeghtTable, Posudable {
//   final double weight;
//   Plate(this.weight);

//   @override
//   void put() {
//     print('put plate');
//   }

//   @override
//   void fill() {
//     print('fill cup');
//   }
// }

// class Table implements WeghtTable {
//   final double weight;
//   Table(this.weight);
// }

// void main() {
//   final listOfSome = <WeghtTable>[
//     Cup(1, 18),
//     Plate(11),
//     Table(56),
//   ];

//   double totalWeight = 0;
//   for (final element in listOfSome) {
//     totalWeight += element.weight;
//   }
//   print(totalWeight);
// }

/* 
-----------
-- Классы: Свойства и методы классов. Static --
-----------
*/

// class Car {
//   int currentSpeed = 0;
//   static int totalCarCount = 0;

//   void printCurrentSpeed() {
//     print(currentSpeed);
//   }

//   static void printTotalCarCount() {
//     print(totalCarCount);
//   }
// }

// void main() {
//   // final car = Car();
//   // car.currentSpeed = 90;
//   Car.totalCarCount = 90;
//   Car.printTotalCarCount();
// }

// String well(List<String> x) {
//   if (x.contains('good')) {
//     return 'Publish';
//   } else {}
//   ;
// }

// int summation(int n) {
//   return List<int>.generate(n, (index) => index * index);
// }

// int summation(int n) {
//   var list = List<int>.generate(n, (i) => i + 1);
//   return n;
// }

// int summation(int n) {
//   return n.;
// }

// String getGrade(int a, int b, int c) {
//   var average = a+b+c/3;

//   if (average >= 90.toDouble()){
//     return 'A';
//   }
// }

// void main(){
//   print(getGrade(90, 95, 97));
// }

// int century(year) {
//   return year.toString().;
// }

// int expressionMatter(a, b, c) {
//   int w = a*(b+c);
//   int x = a*b*c;
//   int y = a+b*c;
//   int z = (a+b)*c;

// }

// int save(List<int> sizes, int hd) {
// //   Если hd > sizes, вернуть первые файлы , которые <= hd.

//   sizes.fold(0, (a,b) => a + b ) >= hd {
//     sizes.
//   }
// }

// int n = 5;
// int rowSumOddNumbers(int n) {
//   var list = List.generate(n, (i) => ++i);
//   list.map((e) => e.isOdd ? list.reduce((a, b) => a + b):0);

//   if (int.isOdd) {
//     return list.reduce((a, b) => a + b);
//   }
// }

// int stray(List<int> numbers) {
//   numbers.where((e) => e != e);
// }

// class Employe {
//   late final String name;
//   final String surname;
//   final String pasport;
//   final int age;
//   final List<int> salary;
//   final int? lenght;
//   Employe(
//     this.name,
//     this.surname,
//     this.pasport,
//     this.age,
//     this.salary,
//     this.lenght,
//   );
// }

// void main() {
//   final Employe one = Employe(
//     'Ivan',
//     'Ivanov',
//     '0202 567567',
//     34,
//     [1000, 1000, 2000, 4000, 50000, 1100, 11, 22, 44, 55, 33, 44],
//     6,
//   );
// final employeOne = {
//   'name': 'Ivan',
//   'surname': 'Ivanov',
//   'age': 45,
// };
// final employeOneName = 'Иван';
// final employeOneSureName = 'Иванч';
// final employeOneFatherName = 'Иванович';
// final employeOnePasport = '0202 567567';
// final employeOneAge = '34';
// final salary = [1000, 1000, 2000, 4000, 50000, 1100, 11, 22, 44, 55, 33, 44];

//   final Employe two = Employe('Kuzma', 'Kuzmin', '0202 567566', 32,
//       [1000, 1000, 2000, 4000, 50000, 1100, 11, 22, 44, 55, 33, 44], null);

//   final list = [one, two];
//   print(one);
//   print(two);
//   one.name = 'dgfdgfd';
//   print(one.name);
// }

// int findDifference(List<int> a, List<int> b) {
//   return a.reduce((value, element) => null);
// }

// АСИНХРОННОСТЬ в DART. Урок 13. Async / Await

import 'dart:io';
import 'dart:async';

// Future<int> sum(int a, int b) {
//   return Future.sync(() => a + b);
// }

// void main() {
//   final a = sum(4, 1);
//   a.then((a) {
//     print(a);
//     final b = sum(a, 9);
//     b.then((b) {
//       print(b);
//       final c = sum(b, a);
//       c.then((c) => print(c));
//     });
//   });
// }

// Future<void> main() async {
//   final a = await sum(1, 4);
//   print(a);
//   final b = await sum(a, 9);
//   print(b);
//   final c = await sum(a, b);
//   print(c);
// }

// Stream<int>? stream;

// StreamSubscription<int>? subscription;

// void main() {
//   print('one');
//   stream = Stream.periodic(Duration(seconds: 1), (tick) => tick);
//   print('two');
//   subscription = stream?.listen((event) {
//     print(event);
//   });
//   print('three');
//   Future.delayed(Duration(seconds: 10), () {
//     subscription?.cancel();
//   });
// }

// Stream?.Bdroadcast() - Подписывание на один стрим несколько раз.

// Stream<int>? stream;

// StreamSubscription<int>? subscription1;
// StreamSubscription<int>? subscription2;

// void main() {
//   print('one');
//   stream = Stream.periodic(Duration(seconds: 1), (tick) => tick).asBroadcastStream();
//   print('two');
//   subscription1 = stream?.listen((event) {
//     print(event);
//   });
//   subscription2 = stream?.listen((event) {
//     print(event);
//   });
//   print('three');
//   Future.delayed(Duration(seconds: 10), () {
//     subscription1?.cancel();
//     subscription2?.cancel();
//   });
// }

// Stream<int>? stream;

// void main() async {
//   print('one');
//   stream =
//       Stream.periodic(Duration(seconds: 1), (tick) => tick).asBroadcastStream();
//   print('two');
//   await for (var item in stream!) {
//     print(item);
//   }
//   print('three');
//   await for (var item in stream!) {
//     print(item);
//   }
// }

// Stream<int>? stream;

// Future<void> listenOne() async {
//   await for (var item in stream!) {
//     print(item);
//   }
// }

// Future<void> listenTwo() async {
//   await for (var item in stream!) {
//     print(item);
//   }
// }

// void main() {
//   print('one');
//   stream =
//       Stream.periodic(Duration(seconds: 1), (tick) => tick).asBroadcastStream();
//   print('two');
//   listenOne();
//   print('three');
//   listenTwo();
// }

// StreamController<int> controller = StreamController<int>();

// StreamSubscription<int>? subscriptionOme;

// void main() {
//   print('one');
//   controller.add(1);
//   controller.add(2);
//   controller.add(3);
//   controller.add(4);
//   controller.add(5);
//   print('two');
//   subscriptionOme = controller.stream.listen((event) {
//     print(event);
//   });
//   print('three');
//   controller.add(6);
//   controller.add(7);
//   controller.add(8);
//   controller.add(9);
//   controller.add(10);
//   Future.delayed(Duration(seconds: 1), () {
//     subscriptionOme?.cancel();
//     controller.close();
//   });
// }

// Iterable<int> generator() sync* {
//   yield 5;
//   yield 7;
//   // list.add(5);
//   // list.add(7);
//   for (var i = 0; i < 10; i++) {
//     yield i;
//   }
// }

import 'dart:collection';

void main() {
  final myList = [1, 3, 5, 8, 7, 2, 11];
  final result = myList.forEach((element) {
    print(element + 1);
  });
}
