import 'package:calculator/buttons/amber_button.dart';
import 'package:calculator/buttons/grey_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              Calculator.extraString,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              Calculator.mainString,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 80,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GridView.count(
              controller: ScrollController(),
              shrinkWrap: true,
              crossAxisCount: 4,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: _createListOfButtons(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _createListOfButtons() {
    List<Widget> list = [
      //TODO: do nice init
      AmberCalculatorButton(
          label: "C",
          tapFunction: () {
            Calculator.eraseAll();
            setState(() {});
          }),
      AmberCalculatorButton(
          label: "⌫",
          tapFunction: () {
            Calculator.eraseLast();
            setState(() {});
          }),
      AmberCalculatorButton(
          label: "%",
          tapFunction: () {
            Calculator.getPercent();
            setState(() {});
          }),
      AmberCalculatorButton(
          label: "÷",
          tapFunction: () {
            Calculator.addOperation("/");
            setState(() {});
          }),

      GreyCalculatorButton(
          label: "7",
          tapFunction: () {
            Calculator.addSymbol("7");
            setState(() {});
          }),
      GreyCalculatorButton(
          label: "8",
          tapFunction: () {
            Calculator.addSymbol("8");
            setState(() {});
          }),
      GreyCalculatorButton(
          label: "9",
          tapFunction: () {
            Calculator.addSymbol("9");
            setState(() {});
          }),
      AmberCalculatorButton(
          label: "×",
          tapFunction: () {
            Calculator.addOperation("*");
            setState(() {});
          }),

      GreyCalculatorButton(
          label: "4",
          tapFunction: () {
            Calculator.addSymbol("4");
            setState(() {});
          }),
      GreyCalculatorButton(
          label: "5",
          tapFunction: () {
            Calculator.addSymbol("5");
            setState(() {});
          }),
      GreyCalculatorButton(
          label: "6",
          tapFunction: () {
            Calculator.addSymbol("6");
            setState(() {});
          }),
      AmberCalculatorButton(
          label: "-",
          tapFunction: () {
            Calculator.addOperation("-");
            setState(() {});
          }),

      GreyCalculatorButton(
          label: "1",
          tapFunction: () {
            Calculator.addSymbol("1");
            setState(() {});
          }),
      GreyCalculatorButton(
          label: "2",
          tapFunction: () {
            Calculator.addSymbol("2");
            setState(() {});
          }),
      GreyCalculatorButton(
          label: "3",
          tapFunction: () {
            Calculator.addSymbol("3");
            setState(() {});
          }),
      AmberCalculatorButton(
          label: "+",
          tapFunction: () {
            Calculator.addOperation("+");
            setState(() {});
          }),

      GreyCalculatorButton(
          label: "00",
          tapFunction: () {
            Calculator.addSymbol("00");
            setState(() {});
          }),
      GreyCalculatorButton(
          label: "0",
          tapFunction: () {
            Calculator.addSymbol("0");
            setState(() {});
          }),
      GreyCalculatorButton(
          label: ".",
          tapFunction: () {
            Calculator.addDot();
            setState(() {});
          }),
      AmberCalculatorButton(
          label: "=",
          tapFunction: () {
            Calculator.getResult();
            Calculator.clear();
            setState(() {});
          }),
    ];
    return list;
  }
}

class Calculator {
  static String _mainString = "";
  static String _extraString = "";

  static String _operation = "";

  static late double _firstNumber;

  static late double _secondNumber;

  static String get mainString => _mainString;
  static String get extraString => _extraString;

  static void addSymbol(String symbol) {
    _mainString += symbol;
  }

  static void addDot() {
    if (_mainString.isEmpty) _mainString += "0.";
    if (!_mainString.contains(".")) _mainString += ".";
  }

  static void eraseLast() {
    if (_mainString.isNotEmpty) {
      _mainString = _mainString.substring(0, _mainString.length - 1);
    }
  }

  static void getResult() {
    try {
      _secondNumber = double.parse(_mainString);
      switch (_operation) {
        case "+":
          sum();
          break;
        case "-":
          difference();
          break;
        case "*":
          mult();
          break;
        case "/":
          division();
          break;
        default:
          throw UnimplementedError();
      }
    } catch (e) {
      print(e);
    }
  }

  static void addOperation(String operation) {
    if (_extraString.isNotEmpty) {
      getResult();
    }
    _operation = operation;
    try {
      _firstNumber = double.parse(_mainString);
      _extraString = _firstNumber.toString() + _operation;
      _mainString = "";
    } catch (e) {
      print(e);
    }
  }

  static void mult() {
    _extraString += _secondNumber.toString();
    _mainString = (_firstNumber * _secondNumber).toString();
    _firstNumber = _firstNumber * _secondNumber;
  }

  static void division() {
    _extraString += _secondNumber.toString();
    _mainString = (_firstNumber / _secondNumber).toString();
    _firstNumber = _firstNumber / _secondNumber;
  }

  static void sum() {
    _extraString += _secondNumber.toString();
    _mainString = (_firstNumber + _secondNumber).toString();
    _firstNumber = _firstNumber + _secondNumber;
  }

  static void difference() {
    _extraString += _secondNumber.toString();
    _mainString = (_firstNumber - _secondNumber).toString();
    _firstNumber = _firstNumber - _secondNumber;
  }

  static void getPercent() {
    _firstNumber = double.parse(_mainString);
    _firstNumber = _firstNumber * 0.01;
    _mainString = _firstNumber.toString();
  }

  static void eraseAll() {
    _mainString = "";
    _extraString = "";
    _secondNumber = 0;
    _firstNumber = 0;
  }

  static void clear() {
    _extraString = "";
    _secondNumber = 0;
    _operation = "";
  }
}
