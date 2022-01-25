

import 'package:case_task_2_4/profile.dart';
import 'package:flutter/material.dart';

// импортируем все файлы сюда:

import './registration.dart';
import './calculator_pizza.dart';
import './first_screen.dart';
import './second_screen.dart';
import './third_screen.dart';
import './basket.dart';
import 'authorization/main_authorization.dart';


void main() {

  runApp(
    MaterialApp(
      //title: 'Наименование',
      // Запустите приложение с именем маршрута "/". В этом случае приложение запускается
      // на первом экране виджет.
      initialRoute: '/',
      routes: {
        // При переходе к маршруту "/" создаем виджет первого экрана.
        '/': (context) => const FirstScreen(),
        // При переходе к маршруту "/второй" создаем виджет второго экрана.
        '/second': (context) => const SecondScreen(),
        '/third': (context) => const ThirdScreen(),
        '/calculator_pizza': (context) =>  const PizzaCalculator(pizza: '', cost: 0 ),
        '/basket.dart': (context) =>  const BasketItems(calcCost: 0, namePizza: '',),
        '/registration': (context) => const RegistrationScreen(),
        '/main_authorization': (context) => const MyApp(),
        '/profile': (context) => const ProfileApp(),
       // '/phone': (context) => MyPhone(),
      },
    ),
  );
}
