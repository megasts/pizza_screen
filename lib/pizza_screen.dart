import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({Key? key}) : super(key: key);

  @override
  _PizzaScreenState createState() => _PizzaScreenState();
}

enum Souse { hot, spec, chees }

class _PizzaScreenState extends State<PizzaScreen> {
  int _slimeDrouse = 0;
  double _pizzaSize = 40;
  Souse? _souse; //= Souse.hot;
  bool _additionalCheese = false;
  int _cost = 0;
  int? _pizzaSizeInt;

  void _costChenged() {
    _pizzaSizeInt = _pizzaSize.round();
    if (_pizzaSize == 20) {
      _cost = 300;
    } else {
      if (_pizzaSize == 40) {
        _cost = 450;
      } else {
        if (_pizzaSize == 60) {
          _cost = 600;
        }
      }
    }
    if (_slimeDrouse != 0) {
      _cost = _cost + _cost ~/ 10;
    }
    if (_souse != null) {
      _cost += 20;
    }
    if (_additionalCheese) {
      _cost += 30;
    }
  }

  void _souseChanged(Souse? value) {
    setState(() {
      _souse = value;
      _costChenged();
    });
  }

  @override
  void initState() {
    super.initState();
    _costChenged(); //call it over here
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: const Color.fromRGBO(255, 190, 80, 1.0),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  SizedBox(
                    width: 208,
                    height: 110,
                    child: Image(
                      image: AssetImage('assets/pizza.png'),
                    ),
                  ),
                ],
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const SizedBox(height: 5),
                const Expanded(
                  flex: 0,
                  child: SizedBox(
                    child: Text(
                      'Калькулятор пиццы',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 32,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                const SizedBox(
                  child: Text(
                    'Выберите параметры:',
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1.1,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  flex: 0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ToggleSwitch(
                      totalSwitches: 2,
                      labels: const ['Обычное тесто', 'Тонкое тесто'],
                      activeBgColors: const [
                        [Color(0xFF0079D0)],
                        [Color(0xFF0079D0)]
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: const Color(0xFFECEFF1),
                      inactiveFgColor: const Color.fromRGBO(0, 0, 0, 0.4),
                      changeOnTap: true,
                      minHeight: 36,
                      minWidth: 300.0,
                      animate: true,
                      animationDuration: 200,
                      cornerRadius: 36.0,
                      initialLabelIndex: _slimeDrouse,
                      fontSize: 16.0,
                      radiusStyle: true,
                      onToggle: (index) {
                        setState(() {
                          _slimeDrouse = index;
                          _costChenged();
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        child: Text(
                          'Размер:',
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: -1.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    '$_pizzaSizeInt см',
                    style: const TextStyle(
                        fontSize: 18,
                        letterSpacing: -1.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    child: Slider(
                      value: _pizzaSize.toDouble(),
                      min: 20,
                      max: 60,
                      divisions: 2,
                      //label: _pizzaSize.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _pizzaSize = value;
                          _costChenged();
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        child: Text(
                          'Соус:',
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 1,
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
                RadioListTile<Souse>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding: const EdgeInsets.only(left: 40, right: 10),
                  title: const Text(
                    "Острый",
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1,
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                  value: Souse.hot,
                  toggleable: true,
                  activeColor: Colors.green,
                  selected: true,
                  groupValue: _souse,
                  onChanged: _souseChanged,
                ),
                RadioListTile<Souse>(
                  contentPadding: const EdgeInsets.only(left: 40, right: 10),
                  title: const Text(
                    "Кисло-сладкий",
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1,
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                  value: Souse.spec,
                  controlAffinity: ListTileControlAffinity.trailing,
                  toggleable: true,
                  selected: true,
                  activeColor: Colors.green,
                  groupValue: _souse,
                  onChanged: _souseChanged,
                ),
                RadioListTile<Souse>(
                  contentPadding: const EdgeInsets.only(left: 40, right: 10),
                  title: const Text(
                    "Сырный",
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1,
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                  value: Souse.chees,
                  controlAffinity: ListTileControlAffinity.trailing,
                  toggleable: true,
                  selected: true,
                  activeColor: Colors.green,
                  groupValue: _souse,
                  onChanged: _souseChanged,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18,
                    right: 11,
                  ),
                  child: Card(
                    elevation: 0,
                    color: const Color(0xFFF0F0F0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      splashColor: Colors.yellow.withAlpha(30),
                      onTap: () {
                        setState(() {
                          _additionalCheese = !_additionalCheese;
                          _costChenged();
                        });
                      },
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: SizedBox(
                              width: 46,
                              height: 46,
                              child: Image(
                                image: AssetImage('assets/cheese.png'),
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 8,
                            child: Text(
                              "Дополнительный сыр",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Switch(
                                value: _additionalCheese,
                                onChanged: (bool value) {
                                  setState(() {
                                    _additionalCheese = value;
                                    _costChenged();
                                  });
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 15, bottom: 5),
                      child: SizedBox(
                        child: Text(
                          'Стоимость:',
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 1,
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18,
                    right: 11,
                  ),
                  child: Container(
                    child: Text(
                      "$_cost рублей",
                      style: const TextStyle(
                          fontSize: 32,
                          letterSpacing: 1.3,
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w800),
                    ),
                    alignment: Alignment.center,
                    height: 36,
                    color: const Color(0xFFECEFF1),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 42,
                  width: 154,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Заказать",
                      style: const TextStyle(
                        fontSize: 16,)
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF0079D0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}
