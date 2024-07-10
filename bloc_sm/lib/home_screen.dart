import 'package:bloc_sm/cubit/counter_cubit.dart';
import 'package:bloc_sm/incremet_dicremt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {

 
 
  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, int>(
              bloc: counterCubit,
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
            builder: (context) => IncremntDicremtPage(),
          ),
        );
      },
     ),
    );
  }
}
