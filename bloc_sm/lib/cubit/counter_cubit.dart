



import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int>{

  CounterCubit():super(1);

  void increment(){
    print(state);
    emit(state +1); 
    print( "after $state");
    

  }

  void dicrement(){
    emit(state -1);
  }


}