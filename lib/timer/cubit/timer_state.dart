part of 'timer_cubit.dart';

@immutable
sealed class TimerState {}

final class TimerInitial extends TimerState {}

final class ObservationTimerRunning extends TimerState {
  final int remainingTicks;
  ObservationTimerRunning(this.remainingTicks);
}

final class StopWatchRunning extends TimerState {
  final int elapsedTime;
  StopWatchRunning(this.elapsedTime);
}

final class TimerComplete extends TimerState {}
