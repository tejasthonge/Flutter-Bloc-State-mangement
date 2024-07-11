import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolistapp/cubit/todo_cubit.dart';
import 'package:todolistapp/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [ 
        BlocProvider(create: (_)=>TodoCubit())
      ],
      child: MaterialApp(
       
        home: HomePage(),
      ),
    );
  }
}
