

part of "counter_bloc.dart";

//we are the all the events in sapertate file it hase the resion
//that is if event are more than two it will confusing so minimise the 
//confusion and increase redability
 

sealed class CounterEvent{}
final class CounterIncrementEvent extends CounterEvent{}  //this is event 
final class CounterDecrementEvent  extends CounterEvent{} //this is eother event
//but we can not pass directly toe this the bloc 


//sealed class :is the anathor feture class dart 3> so se use this get adavantege 
/*
The class ‘HomeState’ can’t be extended, implemented, or mixed in outside of its library because it’s a sealed class.

This restriction brings along an amazing feature called pattern-matching, allowing us to create a variable that acts like a union type, with each type represented as a class extending the main sealed class.
*/