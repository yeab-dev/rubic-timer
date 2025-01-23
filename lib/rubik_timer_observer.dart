import 'package:bloc/bloc.dart';
import 'dart:developer' as developer;

class RubikTimerObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    developer.log('${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }
}
