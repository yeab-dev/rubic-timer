import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubic_timer/timer/cubit/timer_cubit.dart';
import 'package:rubic_timer/timer/presentation/timer_page/inital.dart';
import 'package:rubic_timer/timer/presentation/timer_page/rubik_inspection_timer_running.dart';
import 'package:rubic_timer/timer/presentation/timer_page/rubik_stopwatch_running.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        switch (state) {
          case TimerInitial():
            return RubicTimerInitial();
          case InspectionTimerRunning():
            return RubikInspectionTimerRunning();
          case StopWatchRunning():
            return RubikStopwatchRunning();
          case TimerComplete():
            return Placeholder();
        }
      },
    );
  }
}
