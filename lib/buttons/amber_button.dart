import 'package:calculator/buttons/button.dart';
import 'package:flutter/material.dart';

class AmberCalculatorButton extends CalculatorButton {
  AmberCalculatorButton(
      {Key? key, required String label, required Function tapFunction})
      : super(
            key: key,
            label: label,
            mainColor: Colors.amber,
            splashColor: Colors.amber[700]!,
            fontColor: Colors.black,
            tapFunction: tapFunction);
}
