import 'dart:math';

import 'package:calculator/calculator_brain.dart';
import 'package:flutter_web/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Calculator'),
          ),
          body: Container(
            child: Home(),
          ),
        ));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CalculatorBrain _brain = CalculatorBrain();
  bool userIsInTheMiddleOfTyping = false;

  String _display = '0';
  get displayValue => num.parse(_display);
  set displayValue(num newValue) => _display = newValue.toString();

  void touchDigit(int digit) {
    setState(() {
      if (userIsInTheMiddleOfTyping) {
        String textCurrentlyInDisplay = _display;
        _display = textCurrentlyInDisplay + digit.toString();
      } else {
        userIsInTheMiddleOfTyping = true;
        _display = digit.toString();
      }
    });
  }

  void performOperation(String mathematicalSymbol) {
    setState(() {
      if(userIsInTheMiddleOfTyping) {
        _brain.setOperand(displayValue);
        userIsInTheMiddleOfTyping = false;
      }

      _brain.performOperation(mathematicalSymbol);
      if(_brain.result != null) {
        displayValue = _brain.result;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.blueGrey.shade900,
          alignment: Alignment.topRight,
          child: Text(
            _display,
            style: TextStyle(
              fontSize: 50.0,
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Button(
              buttonText: 'AC',
              color: Colors.blueGrey[800],
              onButtonPressed: () {}
            ),
            Button(
              buttonText: '+/-',
              color: Colors.blueGrey[800],
              onButtonPressed: () {},
            ),
            Button(
              buttonText: '%',
              color: Colors.blueGrey[800],
              onButtonPressed: () {},
            ),
            Button(
              buttonText: '/',
              color: Colors.orange,
              onButtonPressed: () {},
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Button(
              buttonText: 'π',
              onButtonPressed: () {
                performOperation('π');
              }
            ),
            Button(
              buttonText: '7',
              onButtonPressed: () {
                touchDigit(7);
              },
            ),
            Button(
              buttonText: '8',
              onButtonPressed: () {
                touchDigit(8);
              },
            ),
            Button(
              buttonText: '9',
              onButtonPressed: () {
                touchDigit(9);
              },
            ),
            Button(
              buttonText: 'X',
              color: Colors.orange,
              onButtonPressed: () {},
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Button(
              buttonText: '√',
              onButtonPressed: () {
                performOperation('√');
              }
            ),
            Button(
              buttonText: '4',
              onButtonPressed: () {
                touchDigit(4);
              },
            ),
            Button(
              buttonText: '5',
              onButtonPressed: () {
                touchDigit(5);
              },
            ),
            Button(
              buttonText: '6',
              onButtonPressed: () {
                touchDigit(6);
              },
            ),
            Button(
              buttonText: '-',
              color: Colors.orange,
              onButtonPressed: () {},
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Button(
              buttonText: 'cos',
              onButtonPressed: () {
                performOperation('cos');
              }
            ),
            Button(
              buttonText: '1',
              onButtonPressed: () {
                touchDigit(1);
              },
            ),
            Button(
              buttonText: '2',
              onButtonPressed: () {
                touchDigit(2);
              },
            ),
            Button(
              buttonText: '3',
              onButtonPressed: () {
                touchDigit(3);
              },
            ),
            Button(
              buttonText: '+',
              color: Colors.orange,
              onButtonPressed: () {},
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Button(
              buttonText: '±',
              onButtonPressed: () {
                performOperation('±');
              }
            ),
            Button(
              buttonText: '0',
              flex: 2,
              onButtonPressed: () {
                touchDigit(0);
              },
            ),
            Button(
              buttonText: '.',
              onButtonPressed: () {},
            ),
            Button(
              buttonText: '=',
              color: Colors.orange,
              onButtonPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    @required this.buttonText,
    @required this.onButtonPressed,
    this.flex = 1,
    this.color = Colors.blueGrey,
  });

  final String buttonText;
  final int flex;
  final Color color;
  final Function onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: RaisedButton(
          color: color,
          child: Text(buttonText),
          onPressed: onButtonPressed,
        ),
      ),
    );
  }
}
