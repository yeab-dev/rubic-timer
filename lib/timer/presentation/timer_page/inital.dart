import 'package:flutter/material.dart';
import 'package:rubic_timer/timer/cubit/timer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RubicTimerInitial extends StatelessWidget {
  const RubicTimerInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<TimerCubit>().startInspectionTimer(15);
          },
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 230,
                        height: 230,
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                          value: 15,
                          valueColor: AlwaysStoppedAnimation(
                              Color.fromARGB(225, 226, 255, 6)),
                        ),
                      ),
                      Text(
                        "15",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Color(0xFFE2FF06)),
                      )
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 22.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Tap to start the\n inspection time",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
