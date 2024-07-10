

import 'package:bloc_sm/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncremntDicremtPage extends StatefulWidget{


  @override 
  State createState(){
   return  IncremntDicremtPageState();
  }
  

}

class IncremntDicremtPageState extends State<IncremntDicremtPage>{


  @override 
  Widget build(BuildContext context){
    final CounterCubit counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold( 


       floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => counterCubit.dicrement(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () => counterCubit.increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
  
}