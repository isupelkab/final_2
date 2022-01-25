import 'package:flutter/material.dart';
import 'package:case_task_2_4/utilities/global_theme.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      theme: globalTheme(),
      home: Scaffold(

        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(icon:const Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context, false),
          ),
          title: Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: const [
               Text('Наши Акции!',
                    style: TextStyle (fontWeight: FontWeight.bold, fontSize:24, fontStyle: FontStyle.italic,
                      color: Colors.white, )),
              ],
            ),
            alignment: Alignment.center,
          ),
          actions: <Widget>[ // массив активных элементов, по умолчанию выравниваются справа
            IconButton( // кнопка иконка
                tooltip: "Позвонить", //всплывающая текстовая подсказка
                onPressed: () {

                  _callNumber();
                                  },
                icon: const Icon(Icons.phone)
            ),

            IconButton(  // кнопка иконка
                tooltip: "Профиль", //всплывающая текстовая подсказка
                onPressed: () {
                },
                icon: const Icon(Icons.account_circle_sharp)
            ),
          ],
        ),

        body:

        Container(
           color: Colors.grey,
             child: myWidget(context),
         ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/third');// Add your onPressed code here!
          },
          label: const Text('Смотреть меню!', style: TextStyle (fontWeight: FontWeight.bold, fontSize:18,
              color: Colors.indigo)),
          icon: const Icon(
              Icons.zoom_in,
            color: Colors.indigo,
            size: 30,
          ),
          backgroundColor: Colors.orange,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
     ),
    );
  }

  Widget myWidget(BuildContext context) {

        const linkTextStyle = TextStyle (
        fontSize:22,
        fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
        color: Colors.white,
        );

    return GridView.count(
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              foregroundDecoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/greed/1_picture.png"),
                  fit: BoxFit.fill,
                ),
                border: Border.all( color: Colors.orange, width: 8),
                borderRadius: BorderRadius.circular(5),
              ),

            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(15),
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              child: const Text(
                'Каждая 3-я пицца БЕСПЛАТНО! ',
                style: linkTextStyle, textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              foregroundDecoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/greed/2_picture.png"),
                  fit: BoxFit.fill,
                ),
                border: Border.all( color: Colors.orange, width: 8),
                borderRadius: BorderRadius.circular(5),
              ),

            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(15),
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              child: const Text(
                'Каждый понедельник скидка -20%! ',
                style: linkTextStyle, textAlign: TextAlign.center,
              ),
            ),
          ],
        ),

        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              foregroundDecoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/greed/3_picture.png"),
                  fit: BoxFit.fill,
                ),
                border: Border.all( color: Colors.orange, width: 8),
                borderRadius: BorderRadius.circular(5),
              ),

            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(15),
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              child: const Text(
                'Подарок за любые 2 пиццы! ',
                style: linkTextStyle, textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              foregroundDecoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/greed/4_picture.png"),
                  fit: BoxFit.fill,
                ),
                border: Border.all( color: Colors.orange, width: 8),
                borderRadius: BorderRadius.circular(5),
              ),

            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(15),
              height: 110,
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              child: const Text(
                'Каждую среду пепперони за 100р! ',
                style: linkTextStyle, textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              foregroundDecoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/greed/5_picture.png"),
                  fit: BoxFit.fill,
                ),
                border: Border.all( color: Colors.orange, width: 8),
                borderRadius: BorderRadius.circular(5),
              ),

            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(15),
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              child: const Text(
                '1 Пицца в День рождения БЕСПЛАТНО! ',
                style: linkTextStyle, textAlign: TextAlign.center,
              ),
            ),
          ],
        ),

        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              foregroundDecoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/greed/6_picture.png"),
                  fit: BoxFit.fill,
                ),
                border: Border.all( color: Colors.orange, width: 8),
                borderRadius: BorderRadius.circular(5),
              ),

            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(15),
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              child: const Text(
                'Пицца на День всех влюбленных! ',
                style: linkTextStyle, textAlign: TextAlign.center,
              ),
            ),
          ],
        ),

      ],

    );

  }

}


_callNumber() async {
  const number = '0123455557777'; //set the number here
  var res = await FlutterPhoneDirectCaller.callNumber(number);
}