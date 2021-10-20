import 'package:calculator/buttons/button.dart';
import 'package:flutter/material.dart';

class GreyCalculatorButton extends CalculatorButton {
  GreyCalculatorButton(
      {Key? key, required String label, required Function tapFunction})
      : super(
            key: key,
            label: label,
            mainColor: Colors.grey[800]!,
            splashColor: Colors.grey[900]!,
            fontColor: Colors.grey,
            tapFunction: tapFunction);
}
