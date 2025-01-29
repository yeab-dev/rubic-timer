import 'package:flutter/material.dart';
import 'package:rubic_timer/timer/cubit/timer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RubikStopwatchComplete extends StatelessWidget {
  const RubikStopwatchComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        final milliseconds = (state as StopwatchComplete).elapsedTime;
        String minutes =
            ((milliseconds ~/ 60000) % 60).toString().padLeft(2, '0');
        String seconds =
            ((milliseconds ~/ 1000) % 60).toString().padLeft(2, '0');
        String ms = (milliseconds % 1000).toString().padLeft(3, '0');

        return Scaffold(
            body: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                Text(
                  "$minutes:$seconds\n$ms",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 22.0),
                  child: Text(
                    "Tap to stop the timer",
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ));
      },
    );
  }
}
