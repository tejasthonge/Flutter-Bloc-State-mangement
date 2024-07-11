// import 'package:bloc_sm/bloc/event/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_event.dart';

//  class CounterIncrementEvent {}  //this is event 
//  class CounterDecrementEvent {} //this is eother event
// //but we can not pass directly toe this the bloc 



// class CounterBloc extends Bloc<CounterIncrementEvent ,CounterDecrementEvent, int> {
//   CounterBloc() : super(0) {
//     on<CounterIncrementEvent>((event, emit) {
//       emit(state + 1);
//     });
//   }
// }



//above code gives error the reason of we are directly exteding to event wich is not allow in 
//replace of this we can do something like this 
//we create the one parent class and then all events are subclass of that 
//parent class so we can get handle all thhe events 




class CounterBloc extends Bloc< CounterEvent, int> {
  CounterBloc() : super(0) {

    //in this we can hanle all the events in the body of the super bloc contrutor 
    on<CounterIncrementEvent>((event, emit) {
      emit(state + 1);
    });

    //secont event that is dicreement evente
    on<CounterDecrementEvent>((event,emit){
      emit(state-1);
    });

    //so on we can handle all the event as above 

  }
}