import 'package:flutter/material.dart';
import 'package:rubic_timer/timer/cubit/timer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RubikStopwatchComplete extends StatefulWidget {
  const RubikStopwatchComplete({super.key});

  @override
  State<RubikStopwatchComplete> createState() => _RubikStopwatchCompleteState();
}

class _RubikStopwatchCompleteState extends State<RubikStopwatchComplete> {
  bool showButtons = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showButtons = true;
      });
    });
  }

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

        return GestureDetector(
          onTap: () =>
              context.read<TimerCubit>().startStopWatch(et: milliseconds),
          child: Scaffold(
            body: Stack(children: [
              Center(
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
                        "Tap to resume the timer",
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeOut,
                bottom: showButtons ? 100 : -100,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'save',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context.read<TimerCubit>().restart();
                          },
                          child: Text(
                            'discard',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ))
                    ],
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
