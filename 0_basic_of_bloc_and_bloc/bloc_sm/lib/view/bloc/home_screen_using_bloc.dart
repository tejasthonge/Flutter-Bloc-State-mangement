import 'package:bloc_sm/bloc/counter_bloc.dart';
import 'package:bloc_sm/cubit/counter_cubit.dart';
import 'package:bloc_sm/view/bloc/incremet_dicremt_using_bloc.dart';
import 'package:bloc_sm/view/cubit/incremet_dicremt_using_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePageBloc extends StatefulWidget {
  const MyHomePageBloc({super.key, required this.title});

  final String title;

  @override
  State<MyHomePageBloc> createState() => _MyHomePageBlocState();
}
 
class _MyHomePageBlocState extends State<MyHomePageBloc> {

 
 
  @override
  Widget build(BuildContext context) {
    // final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, int>(
              // bloc: counterBloc,
              builder: (context, counter) {
                return Text(
                  '$counter',

                );
              },
            ),
          ],
        ),
      ),
     floatingActionButton: FloatingActionButton( 
      onPressed: ( ){
        Navigator.of(context,).push(
          MaterialPageRoute(
            builder: (context) => IncremntDicremtPageBloc(),
          ),
        );
      },
      child: Icon(Icons.navigate_next
      ),
     ),
    );
  }
}
