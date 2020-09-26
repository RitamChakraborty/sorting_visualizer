import 'package:flutter/material.dart';
import 'package:sortingvisualizer/data/constants.dart';
import 'package:sortingvisualizer/utils/utils.dart';

class SortingDropdown extends StatelessWidget {
  final String _value;
  final ValueChanged<String> _onChanged;

  const SortingDropdown(
      {@required String value, ValueChanged<String> onChanged})
      : this._value = value,
        this._onChanged = onChanged,
        assert(value != null),
        assert(onChanged != null);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      color: Colors.white,
      onPressed: null,
      disabledBorderColor: Theme.of(context).accentColor,
      shape: SHAPE,
      borderSide: BorderSide(
          width: 4,
          style: BorderStyle.solid,
          color: Theme.of(context).accentColor),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          onChanged: _onChanged,
          value: _value,
          items: SortingType.values
              .map(
                (SortingType sortingType) => DropdownMenuItem<String>(
                  value: getSortingTypeString(sortingTypes: sortingType),
                  child: Text(
                    getSortingTypeString(sortingTypes: sortingType),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
    ;
  }
}
