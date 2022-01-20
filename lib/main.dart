import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tusk_cr/bloc/task_cubit.dart';
import 'package:test_tusk_cr/theme/task_theme.dart';
import 'package:test_tusk_cr/ui/screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit()..getTasks(),
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: TaskTheme.lightTheme,
        darkTheme: TaskTheme.darkTheme,
        title: 'Material App',
        home:const SafeArea(child: HomePage()),
      ),
    );
  }
}