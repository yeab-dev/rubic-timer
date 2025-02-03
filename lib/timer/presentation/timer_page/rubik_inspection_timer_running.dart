import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rubic_timer/timer/cubit/timer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RubikInspectionTimerRunning extends StatefulWidget {
  const RubikInspectionTimerRunning({super.key});

  @override
  State<RubikInspectionTimerRunning> createState() =>
      _RubikInspectionTimerRunningState();
}

class _RubikInspectionTimerRunningState
    extends State<RubikInspectionTimerRunning>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final Set<int> _animatedTicks = {};
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 30),
    );

    _animation = Tween<double>(begin: 45.0, end: 100.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startJumpingAnimation() {
    if (!_controller.isAnimating) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        return Scaffold(
          body: Builder(builder: (context) {
            final remainingTicks =
                (state as InspectionTimerRunning).remainingTicks;
            if (remainingTicks == 0) {
              context.read<TimerCubit>().startStopWatch();
            } else if (remainingTicks <= 3 &&
                !_animatedTicks.contains(remainingTicks)) {
              _animatedTicks.add(remainingTicks);
              _startJumpingAnimation();
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                      begin: 0,
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
                          AnimatedDefaultTextStyle(
                            duration: Duration(milliseconds: 100),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    color: Color(0xFFE2FF06),
                                    fontSize: _animation.value),
                            child: Text(
                              state.remainingTicks.toString(),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 22.0),
                    child: Text(
                      "You have ${remainingTicks.toString().length == 1 ? "0${state.remainingTicks}" : "${state.remainingTicks}"}\n seconds to inspect",
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
