import 'package:flutter/material.dart';

class ThemeChangingIcon extends StatelessWidget {
  final ThemeMode _themeMode;

  const ThemeChangingIcon({@required ThemeMode themeMode})
      : this._themeMode = themeMode,
        assert(themeMode != null);

  @override
  Widget build(BuildContext context) {
    return Icon(
      _themeMode == ThemeMode.light ? Icons.nights_stay : Icons.brightness_7,
      color: Theme.of(context).iconTheme.color,
    );
  }
}
