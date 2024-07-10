import 'package:bloc_sm/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {
  late CounterCubit counterCubit;

  @override
  void initState() {
    super.initState();
    counterCubit = CounterCubit();
  }

  @override
  void dispose() {
    counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
