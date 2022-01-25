import 'package:flutter/material.dart';

ThemeData globalTheme() => ThemeData( //стрелочная функция возвращающая объект ThemeData
  fontFamily: "roboto",
  splashColor: Colors.yellow,// цвет вспышки при нажатии кнопок
  colorScheme: ColorScheme.fromSwatch(// цветовые параметры
    brightness: Brightness.dark,// яркость (светлый light режим/темный dark)
    primarySwatch: Colors.orange, // первичный цвет

  ).copyWith(
    secondary: Colors.blue, // вторичный цвет
  ),


  );