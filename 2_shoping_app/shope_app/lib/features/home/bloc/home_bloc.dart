import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shope_app/data/product_data.dart';
import 'package:shope_app/features/home/bloc/home_bloc.dart';
import 'package:shope_app/features/home/model/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishListNavigationEvent>(homeWishListNavigationEvent);
    on<HomeCartListNavigationEvent>(homeCartListNavigationEvent);
    on<HomeAddToCartEvent>(homeAddToCartEvent);
    on<HomeAddToWishListEvent>(homeAddToWishListEvent);
  }


  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit)async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
    emit(HomeLoadedSuccessState(productsList: ShopeProuduct.products.map((e)=>Product(id: e["id"], name: e["name"], price: e["price"], description: e["description"], imageUrl: e["imageUrl"])).toList()));
      
    } catch (e) {
      emit(HomeErrorState());
    }

  }

  FutureOr<void> homeWishListNavigationEvent(HomeWishListNavigationEvent event, Emitter<HomeState> emit) {
    log("Pressed HomeWishListNavigationEvent");
    emit(HomeNavigationToWishListPageState());  //here emiting the the Action state 
  }

  FutureOr<void> homeCartListNavigationEvent(HomeCartListNavigationEvent event, Emitter<HomeState> emit) {

    log('..Pressed HomeCartListNavigationEvent');
    emit(HomeNavigationToCartListPageState());  //here emiting the the Action state 
  }

  FutureOr<void> homeAddToCartEvent(HomeAddToCartEvent event, Emitter<HomeState> emit) {

  }

  FutureOr<void> homeAddToWishListEvent(HomeAddToWishListEvent event, Emitter<HomeState> emit) {
  }

  
}
