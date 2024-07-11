

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolistapp/cubit/todo_cubit.dart';
import 'package:todolistapp/model/todo_model.dart';
import 'package:todolistapp/view/add_todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        centerTitle: true,
        title: Text("Todo List"),
      ),
      body: BlocBuilder<TodoCubit,List<Todo>>(
        builder: (context ,todoState) {

          return ListView.builder(
            itemCount: todoState.length,
            itemBuilder: ( context,index){
            final todos = todoState[index];
            return ListTile(
              title: Text(todos.taskName),
            );
          });
        }
        
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push( 
          MaterialPageRoute(builder: (_)=>AddTodoPage())
        );
        
      } ,
      child:Icon( Icons.add)
      ),

    );
  }
}