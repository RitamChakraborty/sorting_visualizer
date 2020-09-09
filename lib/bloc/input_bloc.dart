export 'events/input_event.dart';
export 'states/input_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sortingvisualizer/bloc/events/input_event.dart';
import 'package:sortingvisualizer/bloc/states/input_state.dart';

class InputBloc extends Bloc<AbstractInputEvent, AbstractInputState> {
  String _bars = "";

  InputBloc() : super(InitialInputState());

  @override
  Stream<AbstractInputState> mapEventToState(AbstractInputEvent event) async* {
    if (event is DigitInputEvent) {
      int tempBars = int.parse(_bars + event.digit);

      if (tempBars > 1000) {
        yield ErrorInputState(
            bars: _bars, error: "Maximum number is 1000");
      } else {
        _bars += event.digit;
        yield CorrectInputState(bars: _bars);
      }
    } else if (event is BackspaceInputEvent) {
      if (_bars.length > 1) {
        _bars = _bars.substring(1);
      } else {
        _bars = "";
      }

      yield CorrectInputState(bars: "");
    } else if (event is VisualizedInputEvent) {
      if (_bars.isEmpty) {
        yield ErrorInputState(bars: _bars, error: "Please enter bar count");
      } else if (int.parse(_bars) < 2) {
        yield ErrorInputState(bars: _bars, error: "Minimum number is 2");
      } else {
        yield VisualizeInputState(bars: _bars);
      }
    }
  }
}
