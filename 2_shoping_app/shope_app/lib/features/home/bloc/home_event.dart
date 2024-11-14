part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}
class HomeWishListNavigationEvent extends HomeEvent {}
class HomeCartListNavigationEvent extends HomeEvent {}
class HomeAddToWishListEvent extends HomeEvent {}
class HomeAddToCartEvent extends HomeEvent {}

