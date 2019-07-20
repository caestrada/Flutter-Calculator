import 'dart:svg';

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
            child: Calculator(),
          ),
        ));
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = '0.0';
  String _output;

  void operandPressed(int number) {
    setState(() {
      result = number.toString();
    });
  }

  void operatorPressed(String op) {
    switch(op) {
      case '+':
        break;
      case '-':
        break;
      case 'X':
        break;
      case '/':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.blueGrey.shade900,
          alignment: Alignment.topRight,
          child: Text(
            result,
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
              onButtonPressed: () {},
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
              buttonText: '7',
              onButtonPressed: () { operandPressed(7); },
            ),
            Button(
              buttonText: '8',
              onButtonPressed: () { operandPressed(8); },
            ),
            Button(
              buttonText: '9',
              onButtonPressed: () { operandPressed(9); },
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
              buttonText: '4',
              onButtonPressed: () { operandPressed(4); },
            ),
            Button(
              buttonText: '5',
              onButtonPressed: () { operandPressed(5); },
            ),
            Button(
              buttonText: '6',
              onButtonPressed: () { operandPressed(6); },
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
              buttonText: '1',
              onButtonPressed: () { operandPressed(1); },
            ),
            Button(
              buttonText: '2',
              onButtonPressed: () { operandPressed(2); },
            ),
            Button(
              buttonText: '3',
              onButtonPressed: () { operandPressed(3); },
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
              buttonText: '0',
              flex: 2,
              onButtonPressed: () { operandPressed(0); },
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
