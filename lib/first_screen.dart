import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:case_task_2_4/utilities/global_theme.dart';
import 'package:case_task_2_4/utilities/strings.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';





class FirstScreen extends StatefulWidget { // виджет состояния для 1 экрана
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // Для использования снэк-бар необходимо внести дополнения в класс состояния,
  // используя глобальный ключ – это важная концепция для доступа к состояниям виджетов
  // в данном случае мы используем глобальный ключ, т.е. систему обмена сообщений,
  // которая относится к нашему классу Scaffold:
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  // С помощью переменной _messengerKey мы можем обращаться к состоянию Scaffold
  @override
  Widget build(BuildContext context) {

    const linkTextStyle = TextStyle (
        fontSize:16,
        fontWeight: FontWeight.bold,
        color: Color(0xFFf59300)
    );



    return MaterialApp(
      theme: globalTheme(),
      scaffoldMessengerKey: _messengerKey, //ссылка на глобальный ключ
      home: Scaffold(
        appBar: AppBar(

          title: Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const SizedBox(width: 30, height: 30, child: Image(image:AssetImage("assets/logo.png")),),
                const SizedBox(
                  width: 10,
                ),
                Text('PIZZA-go!',
                    style: GoogleFonts.lemonada(
                      textStyle: const TextStyle (fontWeight: FontWeight.bold, fontSize:20,
                        color: Colors.white ))),
              ],
            ),
            alignment: Alignment.center,
          ),
          actions: <Widget>[ // массив активных элементов, по умолчанию выравниваются справа
            IconButton( // кнопка иконка
                tooltip: "Позвонить", //всплывающая текстовая подсказка
                onPressed: () { //в обработчик добавляем переход на 3 экран
                  //Navigator.pushNamed(context, '/phone');
                  //var item =1233;
                 //launch(('tel://${123}'));
                 _callNumber();


                },
                icon: const Icon(Icons.phone)
            ),

            IconButton(  // кнопка иконка
                tooltip: "Профиль", //всплывающая текстовая подсказка
                onPressed: () { //в обработчик добавляем переход на 4 экран
                  Navigator.pushNamed(context, '/profile');
                },
                icon: const Icon(Icons.account_circle_sharp)
            ),
          ],
        ),
        drawer: Drawer( // выдвижная панель слева
          child: ListView( // список элементов выдвижной панели
            padding: EdgeInsets.zero, // нуливой отступ
            children: [
               // массив с дочерними элементами
              const DrawerHeader( // заголовок массива дочерних элементов или панели
                  decoration: BoxDecoration(
                   image: DecorationImage(image: AssetImage("assets/images/pizza_1.png"), fit: BoxFit.cover),
                 ),
                padding: EdgeInsets.only(top: 135, left: 8),
                child: Text.rich(
              TextSpan(text: "PIZZA-go!",
                  style: TextStyle(color: Colors.orange, fontSize: 20, fontWeight: FontWeight.bold ),
                  children: <TextSpan> [
                    TextSpan(text: "  Пицца за 15 мин.", style: TextStyle(color: Colors.white, fontSize: 14)),
                  ]
                )
               ),
              ),

              ListTile( // пункт списка
                leading: const Icon(Icons.add), // отображение иконки
                title: const Text("Выбрать пиццу", style: linkTextStyle), // заголовок
                onTap: () { // обработчик нажатия
                  Navigator.pushNamed(context, '/third');// переход на 3 экран
                  _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text("К списку пицц")));
                  // - отображение сообщений в снек-баре,
                  // в современных версиях андроид снэк-бар отображается внизу экрана.
                  // ! – означает, что мы используем null safety
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_ic_call_outlined),
                title: const Text("Заказать по телефону", style: linkTextStyle),
                onTap: () {
                  _callNumber();
                  _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text("Переход к списку номеров")));
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_alert_outlined),
                title: const Text("Акции и предложения", style: linkTextStyle),
                onTap: () {
                  Navigator.pushNamed(context, '/second');// переход на 2 экран

                  _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text("Акции и предложения")));
                },
              ),

              ListTile(
                leading: const Icon(Icons.account_circle_outlined),
                title: const Text("Профиль", style: linkTextStyle),
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                  _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text("Переход в профиль")));
                },
              ),
              ListTile(
                leading: const Icon(Icons.assignment_ind_outlined),
                title: const Text("Авторизоваться", style: linkTextStyle),
                onTap: () {
                  Navigator.pushNamed(context, '/main_authorization');// переход на экран авторизации
                  _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text("Вход по номеру телефона")));
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_to_home_screen),
                title: const Text("Зарегистрироваться", style: linkTextStyle),
                onTap: () {
                  Navigator.pushNamed(context, '/registration');// переход на экран регистрации
                  _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text("Переход к регистрации")));
                },
              ),
              const Divider(
                height: 30,
                thickness: 2,
              ), // разделитель

              const Padding(
                padding: EdgeInsets.only(top: 10, left: 20), //чтобы не примыкал к краю задаем паддинг с отступом только слева
                child: Text("О нас:",
                   style: linkTextStyle,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.assignment_outlined),
                title: const Text("Общая информация", style: linkTextStyle),
                onTap: () {

                  _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text("Переход к информации")));
                },
              ),
              ListTile(
                leading: const Icon(Icons.apartment_rounded),
                title: const Text("Контакты", style: linkTextStyle),
                onTap: () {

                  _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text("Переход в контакты")));
                },
              ),
            ],
          ),
        ),

        body: Container(
            decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/pizza-main.png"),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          height: double.infinity,

          padding: const EdgeInsets.symmetric(horizontal: 10),

          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                    ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 90,
                          ),
                        flex: 1 ,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Expanded(child: SizedBox(
                        height: 90,

                        child: Center(
                          child: Text(Strings.longBody1Text,
                            style: TextStyle(color: Colors.red, fontSize: 22, fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic, backgroundColor: Colors.white),
                          textAlign: TextAlign.center,
                           ),
                        ),
                        ),
                        flex: 1,
                       ),
                     ],
                  ),

                  Container(
                    height: 40,
                      ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                        ),
                        flex: 1,
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      const Expanded(child: SizedBox(
                        height: 110,

                        child: Center(
                          child: Text(Strings.longBody2Text,
                            style: TextStyle(color: Colors.red, fontSize: 22,fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic, backgroundColor: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                        flex: 1,
                      ),
                    ],
                  ),

                  Container(
                    height: 180,
                  ),

                    // третья строка

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                        ),
                        flex: 1,
                      ),
                      const SizedBox(
                        width: 60,
                      ),

                        Expanded(
                          child: SizedBox(
                            height: 100,
                            child: InkWell(child: const Text("Не пропусти наши выгодные Акции!", textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.indigo, fontSize: 22,fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic, decoration: TextDecoration.underline, backgroundColor: Colors.orange),
                            ),
                                onTap: () {Navigator.pushNamed(context, '/second');},
                                ),
                          ),
                          flex: 1,
                        ),
                    ],
                  ),

                  Container(
                    height: 30,
                  ),


                  ElevatedButton(
                    // В виджете "Первый экран"
                    onPressed: () {
                      // Перейдите ко второму экрану, используя именованный маршрут.
                      Navigator.pushNamed(context, '/third');
                    },
                    child: const Text('Выбрать пиццу!', style: TextStyle (fontWeight: FontWeight.bold, fontSize:20,
                        color: Colors.indigo)),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFf59300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



_callNumber() async{
  const number = '0123455557777'; //set the number here
  var res = await FlutterPhoneDirectCaller.callNumber(number);
}




