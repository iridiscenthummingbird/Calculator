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
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "100+115",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "215",
              style: TextStyle(
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
      AmberCalculatorButton(label: "C", tapFunction: () {}),
      AmberCalculatorButton(label: "⌫", tapFunction: () {}),
      AmberCalculatorButton(label: "%", tapFunction: () {}),
      AmberCalculatorButton(label: "÷", tapFunction: () {}),

      GreyCalculatorButton(label: "7", tapFunction: () {}),
      GreyCalculatorButton(label: "8", tapFunction: () {}),
      GreyCalculatorButton(label: "9", tapFunction: () {}),
      AmberCalculatorButton(label: "×", tapFunction: () {}),

      GreyCalculatorButton(label: "4", tapFunction: () {}),
      GreyCalculatorButton(label: "5", tapFunction: () {}),
      GreyCalculatorButton(label: "6", tapFunction: () {}),
      AmberCalculatorButton(label: "-", tapFunction: () {}),

      GreyCalculatorButton(label: "1", tapFunction: () {}),
      GreyCalculatorButton(label: "2", tapFunction: () {}),
      GreyCalculatorButton(label: "3", tapFunction: () {}),
      AmberCalculatorButton(label: "+", tapFunction: () {}),

      GreyCalculatorButton(label: "00", tapFunction: () {}),
      GreyCalculatorButton(label: "0", tapFunction: () {}),
      GreyCalculatorButton(label: ".", tapFunction: () {}),
      AmberCalculatorButton(label: "=", tapFunction: () {}),
    ];
    return list;
  }
}
