

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolistapp/cubit/todo_cubit.dart';

import 'package:todolistapp/model/todo_model.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController taskTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final TodoCubit  cubitObj= BlocProvider.of<TodoCubit>(context);
    return Scaffold( 
      appBar: AppBar( 

        title: Text( 
          "Add Todo "
        ),
      ),


      body: Column( 
        children: [ 

          Text( 
            "Enter the task tile",

          ),
          TextField( 

            controller: taskTEC,
          )
        ],
      ),

      floatingActionButton: BlocBuilder<TodoCubit ,List<Todo>>(
        builder: (context ,blocState) {
          return FloatingActionButton( 
          
            onPressed: (){ 
              cubitObj.addTodo(task: Todo(taskName: taskTEC.text.trim(), date: DateTime.now()));
              
              Navigator.of(context).pop();
            },
            child: Text("Add"),
          );
        }
      ),
    );
  }
}