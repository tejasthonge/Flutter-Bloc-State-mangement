
/*
Cubit is a minimal version or a subset of the BLoC design pattern that simplifies the way we manage the state of an application. To do so, it substitutes the use of events (used in Bloc) with functions that rebuild the UI by emitting different states on a stream.

A Cubit is similar to a Bloc but has no notion of events and relies on methods to emit new states. Every Cubit requires an initial state which will be the state of the Cubit before emit has been called. The current state of a Cubit can be accessed via the state-getter.
*/

//cubit and bloc both are used in the state mangenetet in flutter 
//some difference between them that is cubit is simle and bloc is complicted that has the evevent for each of the button 



/*
what is a Cubit?
Cubit is a minimal version or a subset of the BLoC design pattern that simplifies the way we manage the state of an application. To do so,
 it substitutes the use of events (used in Bloc) with functions that rebuild the UI by emitting different states on a stream.

A Cubit is similar to Bloc but has no notion of events and relies on methods to emit new states. 
Every Cubit requires an initial state which will be the state of the Cubit before emit has been called. The current state of a Cubit can 
be accessed via the state-getter.
*/
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int>{

  CounterCubit():super(1);

  void increment(){
    print(state);
    emit(state +1);   //this is protted function and we can not use out side this class
     
    print( "after $state");
    

  }

  void dicrement(){
    emit(state -1);
  }


}