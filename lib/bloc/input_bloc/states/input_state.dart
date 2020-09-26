import 'package:meta/meta.dart';

abstract class AbstractInputState {
  final String _bars;
  final String _error;

  AbstractInputState({@required String bars, @required String error})
      : this._bars = bars,
        this._error = error,
        assert(bars != null),
        assert(error != null);

  String get bars => _bars;

  String get error => _error;
}

class InitialInputState extends AbstractInputState {
  InitialInputState() : super(bars: "100", error: "");
}

class CorrectInputState extends AbstractInputState {
  CorrectInputState({@required String bars}) : super(bars: bars, error: "");
}

class ErrorInputState extends AbstractInputState {
  ErrorInputState({@required String bars, @required String error})
      : super(bars: bars, error: error);
}

class VisualizeInputState extends AbstractInputState {
  VisualizeInputState({@required String bars})
      : super(bars: bars, error: "");
}