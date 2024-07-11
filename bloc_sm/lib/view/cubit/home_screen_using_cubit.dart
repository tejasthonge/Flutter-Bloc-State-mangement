import 'package:bloc_sm/cubit/counter_cubit.dart';
import 'package:bloc_sm/view/cubit/incremet_dicremt_using_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePageCubit extends StatefulWidget {
  const MyHomePageCubit({super.key, required this.title});

  final String title;

  @override
  State<MyHomePageCubit> createState() => _MyHomePageCubitState();
}
 
class _MyHomePageCubitState extends State<MyHomePageCubit> {

 
 
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
            builder: (context) => IncremntDicremtPageCubit(),
          ),
        );
      },
      child: Icon(Icons.navigate_next
      ),
     ),
    );
  }
}
