import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String _label;
  final Color _splashColor;
  final Color _mainColor;
  final Color _fontColor;
  final Function _tapFunction;
  const CalculatorButton(
      {Key? key,
      required String label,
      required Color splashColor,
      required Color mainColor,
      required Color fontColor,
      required Function tapFunction})
      : _label = label,
        _splashColor = splashColor,
        _mainColor = mainColor,
        _fontColor = fontColor,
        _tapFunction = tapFunction,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    double borderRadius = 25;
    return Material(
      color: _mainColor,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkResponse(
        child: Center(
            child: Text(
          _label,
          style: TextStyle(fontSize: 50, color: _fontColor),
        )),
        splashColor: _splashColor,
        highlightColor: _splashColor,
        highlightShape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: () => _tapFunction(),
      ),
    );
  }
}
