import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  StreamSubscription<int>? _timerSubscription;

  void startObservationTimer(int ticks) {
    _timerSubscription?.cancel();
    _timerSubscription =
        Stream.periodic(const Duration(seconds: 1), (x) => ticks - 1)
            .take(ticks)
            .listen((remainingTicks) {
      emit(ObservationTimerRunning(remainingTicks));
    });
  }

  void startStopWatch() {
    _timerSubscription?.cancel();
    _timerSubscription = Stream<int>.periodic(
      const Duration(milliseconds: 1),
      (x) => x,
    ).listen((elapsedTime) {
      emit(StopWatchRunning(elapsedTime));
    });
  }

  void stopStopWatch() {
    _timerSubscription?.cancel();
    emit(TimerComplete());
  }

  @override
  Future<void> close() {
    _timerSubscription?.cancel();
    return super.close();
  }
}
