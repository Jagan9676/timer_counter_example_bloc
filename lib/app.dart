import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:timer_example_bloc/ticker.dart';
import 'package:timer_example_bloc/timer/bloc/timer_bloc.dart';
import 'package:timer_example_bloc/timer/timer_view/timer_page.dart';
 

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
 

 return   MultiBlocProvider(
  providers: [
  BlocProvider(
      create: (_) => TimerBloc(ticker: const Ticker() ),
      
    ),

   
  ],
  child: MaterialApp(
      title: 'Flutter Timer',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(109, 234, 255, 1),
        colorScheme: const ColorScheme.light(
          secondary: Color.fromRGBO(72, 74, 126, 1),
        ),
      ),
      home:   const TimerPage(),
    ));
  }
}
