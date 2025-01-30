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
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                      begin: 5,
                      end: state.remainingTicks / 15,
                    ),
                    duration: Duration(milliseconds: 1000),
                    builder: (context, value, child) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 230,
                            width: 230,
                            child: CircularProgressIndicator(
                                strokeWidth: 5,
                                value: value,
                                valueColor: AlwaysStoppedAnimation(
                                    Color.fromARGB(225, 226, 255, 6))),
                          ),
                          Text(
                            state.remainingTicks.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Color(0xFFE2FF06)),
                          ),
                        ],
                      );
                    },
                  ),
                  Spacer(),
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
