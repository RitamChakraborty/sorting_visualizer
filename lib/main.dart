import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sortingvisualizer/bloc/input_bloc/input_bloc.dart';
import 'package:sortingvisualizer/bloc/theme_bloc/theme_bloc.dart';
import 'package:sortingvisualizer/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedCubit.storage = await HydratedStorage.build();
  runApp(Wrapper());
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: InputBloc()),
        BlocProvider.value(value: ThemeBloc()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeMode>(
      builder: (BuildContext context, ThemeMode themeMode) {
        return MaterialApp(
          title: 'Sorting Visualizer',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            iconTheme: IconThemeData(
              color: Colors.grey.shade800,
            ),
            textTheme: TextTheme(
              button: TextStyle(color: Colors.white),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            accentColor: Colors.blueAccent,
            buttonColor: Colors.blueAccent,
            iconTheme: IconThemeData(
              color: Colors.grey.shade100,
            ),
          ),
          themeMode: themeMode,
          home: HomePage(),
        );
      },
    );
  }
}
