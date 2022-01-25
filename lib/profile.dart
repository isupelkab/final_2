import 'package:case_task_2_4/utilities/global_theme.dart';
import 'package:flutter/material.dart';
/*
void main() => runApp(MaterialApp(
  home:ProfileApp(),
));
*/
//class ProfileApp extends StatelessWidget {
  //const ProfileApp({Key? key}) : super(key: key);

  class ProfileApp extends StatefulWidget {
    const ProfileApp({Key? key}) : super(key: key);

    @override
    _ProfileAppState createState() => _ProfileAppState();
  }

  class _ProfileAppState extends State<ProfileApp> {




    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        //theme: globalTheme(),
        home: Scaffold(

          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: const [
                  Center(
                    child: Text('Профиль клиента!',
                        style: TextStyle (fontWeight: FontWeight.bold, fontSize:24, fontStyle: FontStyle.italic,
                          color: Colors.white, )),
                  ),
                ],
              ),
              alignment: Alignment.center,
            ),

          ),

          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black38, Colors.black12]
                        )
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 300.0,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/5e227329363657.55ef8df90a1ca.png",
                              ),
                              radius: 50.0,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Имя Фамилия",
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.indigo,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Card(
                              margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                              clipBehavior: Clip.antiAlias,
                              color: Colors.white,
                              elevation: 5.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(

                                        children: const <Widget>[
                                          Text(
                                            "Номер телефона",
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "+79200000000",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.indigo,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    Expanded(
                                      child: Column(

                                        children: const <Widget>[
                                          Text(
                                            "Электронная почта",
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "***********@mail.ru",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.indigo,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "Детальная информация:",
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Адрес: г.............., ул............, дом №...... кв.....\n'
                          'Заказы:................................................',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  width: 300.00,
                ),

              ],
            ),
          ),

          bottomNavigationBar: Container(
            height: 60,
            color: Colors.orange,
            child: InkWell(
              onTap: () => Navigator.pop(context, false),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: const <Widget>[
                    Icon(
                      Icons.home,
                      color: Colors.indigo,
                    ),
                    Text('На главный экран'),
                  ],
                ),
              ),
            ),
          ),


        ),

      );
    }

    }





