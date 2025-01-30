import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  StreamSubscription<int>? _timerSubscription;

  void startInspectionTimer(int ticks) {
    _timerSubscription?.cancel();
    emit(InspectionTimerRunning(ticks));
    _timerSubscription =
        Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
            .take(ticks)
            .listen((remainingTicks) {
      emit(InspectionTimerRunning(remainingTicks));
    });
  }

  void startStopWatch({int et = 0}) {
    _timerSubscription?.cancel();
    _timerSubscription = Stream<int>.periodic(
      const Duration(milliseconds: 47),
      (x) => x * 47 + et,
    ).listen((elapsedTime) {
      emit(StopwatchRunning(elapsedTime));
    });
  }

  void stopStopWatch(int elapsedTime) {
    _timerSubscription?.cancel();
    emit(StopwatchComplete(elapsedTime));
  }

  void restart() {
    emit(TimerInitial());
  }

  @override
  Future<void> close() {
    _timerSubscription?.cancel();
    return super.close();
  }
}
