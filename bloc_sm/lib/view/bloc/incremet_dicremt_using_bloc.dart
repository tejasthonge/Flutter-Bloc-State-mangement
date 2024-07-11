


import 'package:bloc_sm/bloc/counter_bloc.dart';
import 'package:bloc_sm/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncremntDicremtPageBloc extends StatefulWidget{


  @override 
  State createState(){
   return  IncremntDicremtPageBlocState();
  }
  

}

class IncremntDicremtPageBlocState extends State<IncremntDicremtPageBloc>{


  @override 
  Widget build(BuildContext context){
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold( 

      body: Center( 
        child: Text( 
          "Bloc"
        ),
      ),
       floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => counterBloc.add(CounterDecrementEvent()),
            tooltip: 'Decrement',

            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () => counterBloc.add(CounterIncrementEvent()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),

          ),
        ],
      ),
    );
  }
  
}
