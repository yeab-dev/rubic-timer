import 'package:flutter/material.dart';
import 'package:rubic_timer/timer/cubit/timer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RubikInspectionTimerRunning extends StatelessWidget {
  const RubikInspectionTimerRunning({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        return Scaffold(
          body: Builder(builder: (context) {
            String remainingTicks =
                "${(state as InspectionTimerRunning).remainingTicks}".length ==
                        1
                    ? "0${state.remainingTicks}"
                    : "${state.remainingTicks}";
            if (state.remainingTicks == 0) {
              context.read<TimerCubit>().startStopWatch();
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Text("00:$remainingTicks",
                      style: Theme.of(context).textTheme.displayLarge),
                  const Spacer(),
                  // SizedBox(
                  //   height: 100,
                  //   child: Lottie.asset(
                  //       'assets/animations/rotating-cube.json'),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 22.0),
                    child: Text(
                      "You have $remainingTicks\n seconds to inspect",
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            );
          }),
        );
      },
    );
  }
}
