



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolistapp/model/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>>{
  TodoCubit() : super([]);
  void addTodo({required Todo task}){
    emit([...state,task]);
  }
}