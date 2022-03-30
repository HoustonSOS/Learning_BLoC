import 'package:blocLearn/bloc/timer_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:blocLearn/ticker.dart';

import 'actions.dart' as Actions;

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TimerBloc(ticker: Ticker()),
        child: const TimerView(),
    );
  }
}

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Timer"),),
      body: Stack(
        children: [
          const Actions.Background(),
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 100.0),
                  child: Center(child: TimerText(),),
              ),
              Actions.Actions(),
            ],
          )
        ],
      ),
    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr =
      ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr =
      (duration % 60).floor().toString().padLeft(2, '0');

    return Text(
      '$minutesStr:$secondsStr',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

