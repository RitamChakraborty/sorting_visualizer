import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeBloc extends HydratedCubit<ThemeMode> {
  ThemeBloc() : super(ThemeMode.light);

  void changeTheme() {
    if (state == ThemeMode.light) {
      emit(ThemeMode.dark);
    } else if (state == ThemeMode.dark) {
      emit(ThemeMode.light);
    }
  }

  @override
  ThemeMode fromJson(Map<String, dynamic> json) {
    switch (json['themeMode']) {
      case "light":
        return ThemeMode.light;
      case "dark":
        return ThemeMode.dark;
    }

    return null;
  }

  @override
  Map<String, dynamic> toJson(ThemeMode state) {
    String themeModeStr;

    if (state == ThemeMode.light) {
      themeModeStr = "light";
    } else if (state == ThemeMode.dark) {
      themeModeStr = "dark";
    }

    return {'themeMode': themeModeStr};
  }
}
