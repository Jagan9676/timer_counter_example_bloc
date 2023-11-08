import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_example_bloc/counter/cubit/counter_cubit.dart';
import 'package:timer_example_bloc/ticker.dart';
import 'package:timer_example_bloc/timer/bloc/timer_bloc.dart';
import 'package:timer_example_bloc/timer/timer_view/action.dart';
import 'package:timer_example_bloc/timer/timer_view/back_ground.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return const TimerView();
  }
}

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

 CounterCubit cubit = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Timer')),
      body:     Stack(
        children: [
             const Background(),
          // BlocBuilder<CounterCubit, int>(
          //   builder: (context, state) {
          //     return Text('$state',);
          //   },
          // ),
          Text(
            cubit.state.toString()
          ),
       
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(child: TimerText()),
              ),
              Actionss(),
            ],
          ),
        ],
      ),
    floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondsStr',
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
