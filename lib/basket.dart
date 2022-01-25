import 'package:case_task_2_4/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




class BasketItems extends StatefulWidget {


  const BasketItems({Key? key, required this.namePizza,required this.calcCost }) : super(key: key);
  final int calcCost; //здесь определяем значения, получаемые из калькулятора
  final String namePizza;

  @override
  _BasketItemsState createState() => _BasketItemsState();
}

class _BasketItemsState extends State<BasketItems> with AutomaticKeepAliveClientMixin <BasketItems>{

  final List<String> names = <String>[];
  final List<int> msgCount = <int>[];



 //TextEditingController nameController = TextEditingController();

  void addItemToList(){
        setState(() {
      names.insert(0,widget.namePizza);
      msgCount.insert(0, widget.calcCost);
    });
  }

  addStringToSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('namePizza', widget.namePizza);
  }

  addIntToSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt ('calcCost', widget.calcCost);
  }

  getStringValuesSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? namePizza = prefs.getString('namePizza');
    return namePizza;
  }

  getIntValuesSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int? calcCost = prefs.getInt('calcCost');
    return calcCost;
  }


  @override
  Widget build(BuildContext context) {

    const linkTextStyle = TextStyle (
        fontSize:16,
        fontWeight: FontWeight.bold,
        color: Color(0xFFf59300)
    );

    super.build(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(icon:const Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context, false),
          ),
          title: Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: const [
                Text('Корзина!',
                    style: TextStyle (fontWeight: FontWeight.bold, fontSize:22, fontStyle: FontStyle.italic,
                      color: Colors.white, )),
              ],
            ),
            alignment: Alignment.center,
          ),
          actions: <Widget>[ // массив активных элементов, по умолчанию выравниваются справа

            TextButton( // кнопка иконка
              child: const Text('К выбору пицы',
                  style: TextStyle (fontWeight: FontWeight.bold, fontSize:22, fontStyle: FontStyle.italic,
                    color: Colors.white, )),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThirdScreen(),//передаем наименование пиццы в калькулятор
                    ),
                  );
                },

            ),

          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.orange,
          
          child: Column(

              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Card(
                    child: ListTile(
                      title: Text(widget.namePizza,  style: linkTextStyle),
                      trailing: Text("${widget.calcCost} руб.", style: linkTextStyle),

                      isThreeLine: false,
                    ),
                    shadowColor: Colors.grey,
                    elevation: 5,
                    margin: const EdgeInsets.all(8),
                    shape: const RoundedRectangleBorder(
                        side:  BorderSide(color: Colors.grey,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  ),

                ),
                ElevatedButton(
                  child: const Text('Подтвердить выбор',style: TextStyle (fontWeight: FontWeight.bold, fontSize:18,
                      color: Colors.white)),
                  onPressed: () {
                    addItemToList();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
                Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: names.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              title: Text(names[index], style: linkTextStyle),
                              subtitle: Text('${msgCount[index]} руб.',style: linkTextStyle),
                              trailing: IconButton(
                                icon: const Icon(Icons.remove_shopping_cart, color: Colors.orange,),
                                onPressed: () {
                                  setState(() {
                                    names.removeAt(index);
                                  });
                                //removeFromListView(cartList[i]);
                                },
                              ),


                            ),
                            color: Colors.white,
                            shadowColor: Colors.grey,
                            elevation: 5,
                            margin: const EdgeInsets.all(8),
                            shape: const RoundedRectangleBorder(
                                side:  BorderSide(color: Colors.grey,width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          );
                        },

                    )
                ),

                ElevatedButton(
                  child: const Text('Заказать',style: TextStyle (fontWeight: FontWeight.bold, fontSize:18,
                      color: Colors.white)),
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.0),
                    ),
                  ),
                ),
              ]
          ),
        )
    );
  }

  @override

  bool get wantKeepAlive => true;
}







