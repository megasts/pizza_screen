import 'package:flutter/material.dart';

class pizzaScreen extends StatefulWidget {
  const pizzaScreen({Key? key}) : super(key: key);

  @override
  _pizzaScreenState createState() => _pizzaScreenState();
}

class _pizzaScreenState extends State<pizzaScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(toolbarHeight: 0,
        backgroundColor: Color.fromRGBO(253, 110, 1, 0.8),),
        body:
        Column(
          children: [
            SizedBox(height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                SizedBox(width: 232, height: 123,
                  child: Image(image: AssetImage('assets/pizza.png'),),
                ),
              ],
            ),
          Column(
            children: const [
            SizedBox( height: 36),
            SizedBox( height: 36,
                child: Text('Калькулятор пиццы', style:
              TextStyle (
                //height: null,
                fontSize: 32,
                letterSpacing: 1.3,
                //color: Colors.blue,
                //fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600
              ),
              ),
              ),
              SizedBox( height: 9,),
              SizedBox( height: 36,
                child: Text('Выберите параметры:', style:
                TextStyle (
                  //height: null,
                  fontSize: 16,
                  letterSpacing: 1.1,
                  //color: Colors.blue,
                  //fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700
                ),
                ),
              ),
              SizedBox( height: 33,),
          ]),
    ]),
        //Text('Калькулятор пиццы'),


    ),
    );
  }
}
