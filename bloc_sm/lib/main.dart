import 'package:bloc_sm/bloc/counter_bloc.dart';
import 'package:bloc_sm/cubit/counter_cubit.dart';
import 'package:bloc_sm/main_screen.dart';
import 'package:bloc_sm/view/bloc/home_screen_using_bloc.dart';
import 'package:bloc_sm/view/cubit/home_screen_using_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [ 
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => CounterBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      home:MainScreen()
    ));
  }
}
