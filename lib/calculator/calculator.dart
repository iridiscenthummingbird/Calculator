import 'package:flutter/material.dart';

class Calculator {
  static String _mainString = "";
  static String _extraString = "";

  static String _operation = "";

  static late double _firstNumber;

  static late double _secondNumber;

  static String get mainString => _mainString;
  static String get extraString => _extraString;

  static double _fontSize = 80;
  static double get fontSize => _fontSize;

  static void changeFontSize() {
    if (_mainString.length < 9) {
      _fontSize = 80;
    } else if (_mainString.length < 14) {
      _fontSize = 52;
    } else if (_mainString.length < 25) {
      _fontSize = 30;
    }
  }

  static void addSymbol(String symbol) {
    _mainString += symbol;
    changeFontSize();
  }

  static void addDot() {
    if (_mainString.isEmpty) _mainString += "0.";
    if (!_mainString.contains(".")) _mainString += ".";
  }

  static void eraseLast() {
    if (_mainString.isNotEmpty) {
      _mainString = _mainString.substring(0, _mainString.length - 1);
      changeFontSize();
    }
  }

  static void getResult(BuildContext context) {
    try {
      _secondNumber = double.parse(_mainString.isNotEmpty ? _mainString : "0");
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
      final snackBar = SnackBar(
        content: Text(e.toString()),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          textColor: Colors.amber,
          label: 'Undo',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  static void addOperation(String operation, BuildContext context) {
    if (_extraString.isNotEmpty) {
      getResult(context);
    }
    _operation = operation;
    try {
      _firstNumber = double.parse(_mainString);
      _extraString = _firstNumber.toString() + _operation;
      _mainString = "";
    } catch (e) {
      final snackBar = SnackBar(
        content: Text(e.toString()),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          textColor: Colors.amber,
          label: 'Undo',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
    changeFontSize();
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
