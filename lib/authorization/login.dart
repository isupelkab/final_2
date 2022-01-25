import 'package:case_task_2_4/authorization/profile_input.dart';
import 'package:flutter/material.dart';
import 'my_shared_preferences.dart';

import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    return LoginState();
  }
}

class LoginState extends State<Login> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerUserName = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();

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

    return SafeArea(
      child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/app-clipart.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Form(
              key: formKey,
              autovalidate: false,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 30,),
                    Text('PIZZA-go!',
                        style: GoogleFonts.lemonada(
                            textStyle: const TextStyle (fontWeight: FontWeight.bold, fontSize:24,
                                color: Colors.white ))),
                    const SizedBox(height: 30,),
                    const SizedBox(width: 90, height: 90, child: Image(image:AssetImage("assets/logo.png")),),
                    const SizedBox(height: 60,),
                    const Text("Введите логин в виде 10 цифр номера телефона", textAlign: TextAlign.center,
                        style: TextStyle (fontWeight: FontWeight.bold, fontSize:16, color: Colors.black,
                            fontStyle: FontStyle.normal, backgroundColor: Colors.white)),

                    const SizedBox(height: 30),
                    Container(
                      height: 50,
                      width: 350,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Text("Логин:", style: TextStyle(fontSize: 18)),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              controller: controllerEmail,
                              decoration: const InputDecoration(
                                hintText: "Введите номер телефона",
                              ),
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return "Номер не введен";
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: 50,
                      width: 350,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Text("Имя:", style: TextStyle(fontSize: 18)),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Введите свое имя",
                                ),
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Имя не указано";
                                  }
                                },
                                controller: controllerUserName),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: 50,
                      width: 350,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Text("Пароль:", style: TextStyle(fontSize: 18)),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Введите пароль",
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Пароль не введен";
                                  }
                                },
                                controller: controllerPassword),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 70),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFf59300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36.0),
                          ),
                        ),
                        child: const Text("Войти",
                            style: TextStyle(color: Colors.white, fontSize: 18)),
                        onPressed: () {
                          if(formKey.currentState!.validate()) {
                            var getEmail = controllerEmail.text;
                            var getUserName = controllerUserName.text;
                            var getPassword = controllerPassword.text;

                            MySharedPreferences.instance
                                .setStringValue("email", getEmail);
                            MySharedPreferences.instance
                                .setStringValue("username", getUserName);
                            MySharedPreferences.instance
                                .setStringValue("password", getPassword);
                            MySharedPreferences.instance
                                .setBooleanValue("loggedin", true);

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => const Profile()),
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}