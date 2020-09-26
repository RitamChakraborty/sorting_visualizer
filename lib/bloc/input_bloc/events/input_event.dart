import 'package:meta/meta.dart';

abstract class AbstractInputEvent {}

class DigitInputEvent extends AbstractInputEvent {
  final String _digit;

  DigitInputEvent({@required String digit})
      : this._digit = digit,
        assert(digit != null);

  String get digit => _digit;
}

class BackspaceInputEvent extends AbstractInputEvent {}

class VisualizedInputEvent extends AbstractInputEvent {}
