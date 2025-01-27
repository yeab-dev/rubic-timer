part of 'timer_cubit.dart';

@immutable
sealed class TimerState {}

final class TimerInitial extends TimerState {}

final class InspectionTimerRunning extends TimerState {
  final int remainingTicks;
  InspectionTimerRunning(this.remainingTicks);
}

final class StopwatchRunning extends TimerState {
  final int elapsedTime;
  StopwatchRunning(this.elapsedTime);
}

final class StopwatchComplete extends TimerState {
  StopwatchComplete(this.elapsedTime);
  final int elapsedTime;
}
