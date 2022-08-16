// // Интерфейс для исходной печи, которая работает в градусах Фаренгейта.
// abstract class IOven {
//   double getTemperature();
//   void setTemperature(double t);
// }

// // Интефейс для градусов Цельсия
// abstract class ICelsiousOven {
//   double getCelsiousTemperature();
//   void setCelsiousTemperature(double t);
//   double getOriginalTemperature();
// }

// class OriginalOven implements IOven {
//   double temperature;

//   OriginalOven(this.temperature) {
//     assert(temperature >= fahrenheitZero, 'This isn\'t a refrigerator');
//   }

// // Метод для возвращения текущей температуры в Фаренгейтах.
//   @override
//   double getTemperature() {
//     getTemperature() {
//       return temperature;
//     }
//   }

// // Метод установки этой температуры для исходной печи
//   @override
//   void setTemperature(double t) {
//     assert(temperature >= fahrenheitZero, 'Does the ovn freeze?');
//   }
// }

// const celsiousToFahrenheit = 9.0 / 5;
// const fahrenheitToCelsious = 5.0 / 9;
// const fahrenheitZero = 32;

// class OvenAdapter implements ICelsiousOven {
//   IOven originalOven;
//   double temperature = 0;

//   OvenAdapter(this.originalOven) {
//     temperature = _initTemperature();
//   }

//   double _initTemperature() {
//     return (fanrenheitToCelsious *
//         (originalOven.getTemperature() - fahrenheitZero));
//   }

//   @override
//   double getCelsiousTemperature() {
//     return temperature;
//   }

//   @override
//   double getOriginalTemperature() {
//     return originalOven.getTemperature();
//   }

//   @override
//   void setCelsiousTemperature(double t) {
//     assert(t >= 0, 'Oo');
//   }

// }
