import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final double _height;
  final double _width;
  final double _barWidth;
  final int _animationSpeed;

  const Bar({
    @required double height,
    @required double width,
    @required double barWidth,
    @required int animationSpeed,
  })  : this._height = height,
        this._width = width,
        this._barWidth = barWidth,
        this._animationSpeed = animationSpeed,
        assert(height != null),
        assert(width != null),
        assert(barWidth != null),
        assert(animationSpeed != null);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: _animationSpeed),
      height: _height,
      width: _barWidth,
      margin: EdgeInsets.only(left: _width),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(_barWidth / 2),
          topRight: Radius.circular(_barWidth / 2),
        ),
      ),
    );
  }
}
