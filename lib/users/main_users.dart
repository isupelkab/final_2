
import 'package:case_task_2_4/users/users_list_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users list',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Список пользователей'),
        ),
        body: const Center(
            child: UsersListScreen()
        ),
      ),
    );
  }
}
