



import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolistapp/model/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>>{


  TodoCubit() : super([]);


  void addTodo({required Todo task}){
    if(task.taskName.isEmpty){
      addError("Hay Tasktitle is not Empty",);  
    }
    emit([...state,task]);

  }


  @override
  void onError(Object error, StackTrace stackTrace) {  //this is the method of cubit and uesed to show or print the error by addEroor like inside the addTodo method method

    // TODO: implement onError
    super.onError(error, stackTrace);
    log("$error");
  }
  
}