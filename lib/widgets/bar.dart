import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final double _height;
  final double _margin;
  final double _barWidth;
  final int _animationSpeed;
  final Color _color;

  const Bar({
    @required double height,
    @required double margin,
    @required double barWidth,
    @required int animationSpeed,
    Color color,
  })  : this._height = height,
        this._margin = margin,
        this._barWidth = barWidth,
        this._animationSpeed = animationSpeed,
        this._color = color,
        assert(height != null),
        assert(margin != null),
        assert(barWidth != null),
        assert(animationSpeed != null);

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: Duration(milliseconds: _animationSpeed),
      padding: EdgeInsets.only(left: _margin),
      child: Container(
        height: _height,
        width: _barWidth,
        decoration: BoxDecoration(
          color: _color ?? Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_barWidth / 2),
            topRight: Radius.circular(_barWidth / 2),
          ),
        ),
      ),
    );
  }
}
