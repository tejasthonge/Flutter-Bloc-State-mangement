part of 'home_bloc.dart';

@immutable
abstract class HomeState {}   //regular state
abstract class HomeActionState extends HomeState{}// this action state 


class HomeInitial extends HomeState{}
class HomeLoadedSuccessState extends HomeState{
  final List<Product> productsList;
   HomeLoadedSuccessState({required this.productsList });
}
class HomeLoadingState extends HomeState{}
class HomeErrorState extends HomeState{}


class HomeNavigationToWishListPageState extends HomeActionState{}
class HomeNavigationToCartListPageState extends HomeActionState{} 
