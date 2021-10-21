import 'package:calculator/buttons/amber_button.dart';
import 'package:calculator/buttons/grey_button.dart';
import 'package:calculator/calculator/calculator.dart';
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
              style: TextStyle(
                color: Colors.white,
                fontSize: Calculator.fontSize,
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
            Calculator.addOperation("/", context);
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
            Calculator.addOperation("*", context);
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
            Calculator.addOperation("-", context);
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
            Calculator.addOperation("+", context);
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
            Calculator.getResult(context);
            Calculator.clear();
            setState(() {});
          }),
    ];
    return list;
  }
}
