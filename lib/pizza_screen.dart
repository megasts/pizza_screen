import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class pizzaScreen extends StatefulWidget {
  const pizzaScreen({Key? key}) : super(key: key);

  @override
  _pizzaScreenState createState() => _pizzaScreenState();
}
int _slimeDrouse = 0;

class _pizzaScreenState extends State<pizzaScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(toolbarHeight: 0,
        backgroundColor: Color.fromRGBO(253, 110, 1, 0.8),),
        body:
        SingleChildScrollView(
        child: Column(
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
            children: [
            SizedBox( height: 36),
            const SizedBox( height: 36,
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
              const SizedBox( height: 36,
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

              ToggleSwitch(
                changeOnTap: true,
                minHeight: 36,
                minWidth: 300.0,
                animate: true,
                animationDuration: 200,
                cornerRadius: 36.0,
                activeBgColors: const [[Color(0xFF0079D0)], [Color(0xFF0079D0)]],
                activeFgColor: Colors.white,
                inactiveBgColor: const Color(0xFFECEFF1),
                inactiveFgColor: const Color.fromRGBO(0,0,0,0.4),
                initialLabelIndex: _slimeDrouse,
                totalSwitches: 2,
                fontSize: 16.0,
                labels: const ['Обычное тесто', 'Тонкое тесто'],
                //customTextStyles: const [TextStyle(letterSpacing: -1.0),
                //  TextStyle(letterSpacing: -1.0)],
                radiusStyle: true,
                onToggle: (index) {_slimeDrouse = index;
                setState(() {_slimeDrouse = index;} );
                },
              ),
              SizedBox( height: 33,),
          ]),




    ]),
        ),
        //Text('Калькулятор пиццы'),


    ),
    );
  }
}
