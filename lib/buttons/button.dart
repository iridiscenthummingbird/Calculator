import 'package:flutter/material.dart';

class CalculatorButton extends StatefulWidget {
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
  _CalculatorButtonState createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    value: 1.0,
    lowerBound: 0.9,
    upperBound: 1.0,
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double borderRadius = 25;
    return ScaleTransition(
      scale: _animation,
      child: Material(
        color: widget._mainColor,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkResponse(
          child: Center(
              child: Text(
            widget._label,
            style: TextStyle(fontSize: 50, color: widget._fontColor),
          )),
          splashColor: widget._splashColor,
          highlightColor: widget._splashColor,
          highlightShape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: () {
            widget._tapFunction();
            _controller.reverse().whenComplete(() => _controller.fling());
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
