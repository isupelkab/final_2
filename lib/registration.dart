import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
            color: Color(0xFF5c7c8c), width: 2 )
    );
    const linkTextStyle = TextStyle (
        fontSize:18,
        fontWeight: FontWeight.bold,
        color: Color(0xFFf59300)
    );
    return MaterialApp(
      home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/app-clipart_2.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(height: 80,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),

                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Container(
                        alignment: Alignment.centerRight,
                        child: const SizedBox(width: 30, height: 30, child: Image(image:AssetImage("assets/images/icon_1.png")),),
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: const Text("Регистрация", textAlign: TextAlign.center,
                          style: TextStyle (fontWeight: FontWeight.bold, fontSize:24, color: Color.fromRGBO(225,225,225,0.95)),
                        ),
                        height: 30,
                      ),
                    ],

                  ),
                ),
                const SizedBox(height: 40,),
                const Text("Чтобы зарегистрироваться введите свой номер телефона и почту", textAlign: TextAlign.center,
                  style: TextStyle (fontWeight: FontWeight.bold, fontSize:16, color: Color.fromRGBO(225,225,225,0.95) ),),

                const SizedBox(height: 40,),
                const TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: "Номер телефона",
                  ),
                ),
                const SizedBox(height: 20,),
                const TextField(

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email),
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: "Электронная почта",
                  ),
                ),
                const SizedBox(height: 30,),
                const Text("Вам придет четырехзначный код, который будет вашим паролем", textAlign: TextAlign.center,
                  style: TextStyle (fontWeight: FontWeight.bold, fontSize:16, color: Color(0xFF070303) ),),
                const SizedBox(height: 20,),
                const Text("Изменить пароль можно будет в профиле после регистрации", textAlign: TextAlign.center,
                  style: TextStyle (fontWeight: FontWeight.bold, fontSize:16, color: Color(0xFF070303) ),),
                const SizedBox(height: 40,),
                SizedBox(width: 210, height: 50,child:
                ElevatedButton(onPressed: () {},
                  child: const Text("Зарегистрироваться",
                    style: TextStyle (fontWeight: FontWeight.bold, fontSize:18,
                        color: Color.fromRGBO(225,225,225,0.95) ),),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFf59300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.0),
                    ),
                  ),
                )
                ),
                const SizedBox(height: 40,),
                InkWell(child: const Text("Назад", textAlign: TextAlign.center,
                  style: linkTextStyle,),onTap: () {Navigator.pop(context);}),
              ],),
            ),
          )
      ),
    );
  }
}

