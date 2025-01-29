import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubic_timer/timer/cubit/timer_cubit.dart';
import 'package:rubic_timer/timer/presentation/timer_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color(0xFFE2FF06)))),
          scaffoldBackgroundColor: Color(0xFF021903),
          textTheme: TextTheme(
              displayLarge: TextStyle(
                fontFamily: 'Tektur',
                fontSize: 60.0,
                color: Color(0xFFE2FF06),
              ),
              titleSmall: TextStyle(
                fontFamily: 'Tektur',
                fontSize: 20.0,
                color: Color(0xFFE2FF06),
              ),
              bodyLarge: TextStyle(
                  color: Color(0xFF021903), fontWeight: FontWeight.w500))),
      home: BlocProvider(
        create: (_) => TimerCubit(),
        child: TimerPage(),
      ),
    );
  }
}
