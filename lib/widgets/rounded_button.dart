import 'package:flutter/material.dart';
import 'package:sortingvisualizer/data/constants.dart';

class RoundedButton extends StatelessWidget {
  final String _text;
  final Function _onPressed;

  const RoundedButton({@required String text, Function onPressed})
      : this._text = text,
        this._onPressed = onPressed,
        assert(text != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: MaterialButton(
        color: Theme.of(context).accentColor,
        shape: SHAPE,
        onPressed: _onPressed,
        child: Text(
          _text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
