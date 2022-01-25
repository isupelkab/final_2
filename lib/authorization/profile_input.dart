import 'package:flutter/material.dart';
import '../first_screen.dart';
import 'my_shared_preferences.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  String email = "";
  String username = "";

  ProfileState() {
    MySharedPreferences.instance
        .getStringValue("email")
        .then((value) => setState(() {
      email = value;
    }));
    MySharedPreferences.instance
        .getStringValue("username")
        .then((value) => setState(() {
      username = value;
    }));
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Привет, " + username,
                  style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Text(
                  email,
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 80),
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
                      child: const Text("На главный экран", textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18,
                          )),
                      onPressed: () {
                        MySharedPreferences.instance.removeAll();


                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => const FirstScreen()));

                        /*
                        Navigator.push(context,
                         MaterialPageRoute(
                            builder: (context) => const FirstScreen(),//передаем итоговые данные в корзину
                          ),
                        );
                        */


                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}