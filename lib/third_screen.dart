import 'package:case_task_2_4/utilities/strings.dart';
import 'package:flutter/material.dart';
import 'package:case_task_2_4/utilities/global_theme.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'calculator_pizza.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key, }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: globalTheme(),
      home: Scaffold(

        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(icon:const Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context, true),
          ),
          title: Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: const [
                Text('Меню!',
                    style: TextStyle (fontWeight: FontWeight.bold, fontSize:22, fontStyle: FontStyle.italic,
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
            IconButton( // кнопка иконка
                tooltip: "На главную", //всплывающая текстовая подсказка
                onPressed: () {
                 Navigator.pop(context, '/first');
                  //Navigator.pushNamed(context, '/first');
                },
                icon: const Icon(Icons.home)
            ),
            IconButton(  // кнопка иконка
                tooltip: "Профиль", //всплывающая текстовая подсказка
                onPressed: () {
                },
                icon: const Icon(Icons.account_circle_sharp)
            ),
          ],
        ),

        body: Container(
          color: Colors.orange,
          child: const MyPizzaList(


          ),
        ),
      ),
    );
  }
}

class MyPizzaList extends StatefulWidget {


  const MyPizzaList({Key? key }) : super(key: key);

  @override
  _MyPizzaListState createState() => _MyPizzaListState();
}

class _MyPizzaListState extends State<MyPizzaList> {

  final List<String> pizza = ["Пепперони", "Мясная барбекю", "Гавайская", "Грибная", "Овощная", "Маргарита", "4 сыра", "Морская"];

  final List<int> cost = [200,300,350,200,250,300,350,400];



  @override
  Widget build(BuildContext context) {

    const linkTextStyle = TextStyle (
        fontSize:16,
        fontWeight: FontWeight.bold,
        color: Color(0xFFf59300)
    );

    return ListView(
      scrollDirection: Axis.vertical, // вертикальный список
      padding: const EdgeInsets.all(8.0),
      itemExtent: 110.0,
      children:   [ // элементы списка (любые виджеты) из class MyListItem
      Card(
            child: ListTile(
              leading: SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.asset("assets/images/greed/items_icon/pepperoni.png",fit:BoxFit.fill)
              ),
              title: Text(pizza[0], style: linkTextStyle),
              subtitle: const Text(Strings.longBody3Text),
              trailing: Text("${cost[0]} руб.", style: linkTextStyle),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PizzaCalculator(pizza: pizza[0],cost: cost[0],),//передаем наименование пиццы в калькулятор
                  ),
                );
              },
              isThreeLine: true,
            ),
          shadowColor: Colors.grey,
          elevation: 5,
          margin: const EdgeInsets.all(8),
          shape: const RoundedRectangleBorder(
          side:  BorderSide(color: Colors.grey,width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
      ),



        Card(
          child: ListTile(
            leading: SizedBox(
                height: 60,
                width: 60,
                child: Image.asset("assets/images/greed/items_icon/meat.png",fit:BoxFit.fill)
            ),
            title: Text(pizza[1], style: linkTextStyle),
            subtitle: const Text(Strings.longBody4Text),
            trailing: Text("${cost[1]} руб.", style: linkTextStyle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PizzaCalculator(pizza: pizza[1],cost: cost[1]),//передаем наименование пиццы в калькулятор
                ),
              );
            },
            isThreeLine: true,
          ),
          shadowColor: Colors.grey,
          elevation: 5,
          margin: const EdgeInsets.all(8),
          shape: const RoundedRectangleBorder(
              side:  BorderSide(color: Colors.grey,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        ),

        Card(
          child: ListTile(
            leading: SizedBox(
                height: 60,
                width: 60,
                child: Image.asset("assets/images/greed/items_icon/hawaii.png",fit:BoxFit.fill)
            ),
            title: Text(pizza[2], style: linkTextStyle),
            subtitle: const Text(Strings.longBody5Text),
            trailing: Text("${cost[2]} руб.", style: linkTextStyle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PizzaCalculator(pizza: pizza[2],cost: cost[2]),//передаем наименование пиццы в калькулятор
                ),
              );
            },
            isThreeLine: true,
          ),
          shadowColor: Colors.grey,
          elevation: 5,
          margin: const EdgeInsets.all(8),
          shape: const RoundedRectangleBorder(
              side:  BorderSide(color: Colors.grey,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        ),

        Card(
          child: ListTile(
            leading: SizedBox(
                height: 60,
                width: 60,
                child: Image.asset("assets/images/greed/items_icon/mushrooms.png",fit:BoxFit.fill)
            ),
            title: Text(pizza[3], style: linkTextStyle),
            subtitle: const Text(Strings.longBody6Text),
            trailing: Text("${cost[3]} руб.", style: linkTextStyle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PizzaCalculator(pizza: pizza[3],cost: cost[3]),//передаем наименование пиццы в калькулятор
                ),
              );
            },
            isThreeLine: true,
          ),
          shadowColor: Colors.grey,
          elevation: 5,
          margin: const EdgeInsets.all(8),
          shape: const RoundedRectangleBorder(
              side:  BorderSide(color: Colors.grey,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        ),

        Card(
          child: ListTile(
            leading: SizedBox(
                height: 60,
                width: 60,
                child: Image.asset("assets/images/greed/items_icon/vegetables.png",fit:BoxFit.fill)
            ),
            title: Text(pizza[4], style: linkTextStyle),
            subtitle: const Text(Strings.longBody7Text),
            trailing: Text("${cost[4]} руб.", style: linkTextStyle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PizzaCalculator(pizza: pizza[4],cost: cost[4]),//передаем наименование пиццы в калькулятор
                ),
              );
            },
            isThreeLine: true,
          ),
          shadowColor: Colors.grey,
          elevation: 5,
          margin: const EdgeInsets.all(8),
          shape: const RoundedRectangleBorder(
              side:  BorderSide(color: Colors.grey,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        ),

        Card(
          child: ListTile(
            leading: SizedBox(
                height: 60,
                width: 60,
                child: Image.asset("assets/images/greed/items_icon/margarita.png",fit:BoxFit.fill)
            ),
            title: Text(pizza[5], style: linkTextStyle),
            subtitle: const Text(Strings.longBody8Text),
            trailing: Text("${cost[5]} руб.", style: linkTextStyle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PizzaCalculator(pizza: pizza[5],cost: cost[5]),//передаем наименование пиццы в калькулятор
                ),
              );

            },
            isThreeLine: true,
          ),
          shadowColor: Colors.grey,
          elevation: 5,
          margin: const EdgeInsets.all(8),
          shape: const RoundedRectangleBorder(
              side:  BorderSide(color: Colors.grey,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        ),

        Card(
          child: ListTile(
            leading: SizedBox(
                height: 60,
                width: 60,
                child: Image.asset("assets/images/greed/items_icon/cheese.png",fit:BoxFit.fill),
            ),
            title: Text(pizza[6], style: linkTextStyle),
            subtitle: const Text(Strings.longBody9Text),
            trailing: Text("${cost[6]} руб.", style: linkTextStyle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PizzaCalculator(pizza: pizza[6],cost: cost[6]),//передаем наименование пиццы в калькулятор
                ),
              );
            },
            isThreeLine: true,
          ),
          shadowColor: Colors.grey,
          elevation: 5,
          margin: const EdgeInsets.all(8),
          shape: const RoundedRectangleBorder(
              side:  BorderSide(color: Colors.grey,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        ),

        Card(
          child: ListTile(
            leading: SizedBox(
                height: 60,
                width: 60,
                child: Image.asset("assets/images/greed/items_icon/pizza-dary-morya.png",fit:BoxFit.fill)
            ),
            title: Text(pizza[7], style: linkTextStyle),
            subtitle: const Text(Strings.longBody10Text),
            trailing: Text("${cost[7]} руб.", style: linkTextStyle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PizzaCalculator(pizza: pizza[7],cost: cost[7]),//передаем наименование пиццы в калькулятор
                ),
              );
            },
            isThreeLine: true,
          ),
          shadowColor: Colors.grey,
          elevation: 5,
          margin: const EdgeInsets.all(8),
          shape: const RoundedRectangleBorder(
              side:  BorderSide(color: Colors.grey,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        ),


      ],
    );
  }
}

_callNumber() async{
  const number = '0123455557777'; //set the number here
  var res = await FlutterPhoneDirectCaller.callNumber(number);
}
