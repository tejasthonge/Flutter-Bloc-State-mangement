import 'dart:async';
import 'dart:developer';

import 'package:api_int/fetures/posts/repository/post_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../models/post_data_ui_mode.dart';

part 'post_event.dart';
part 'post_state.dart';

// event --> bloc --> emit new State --> Ui

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostInitialFethEvent>(postInitialFethEvent);
  }

  FutureOr<void> postInitialFethEvent(
      PostInitialFethEvent event, Emitter<PostState> emit) async {
        List<PostModel> posts =[];
        emit(PostFetchLoadingState());
        posts = await PostRepository.fetchPost();
        if(posts.isNotEmpty){
          emit(PostFetheingSuccessState(postData: posts));
        }
        else{
          emit(PostFetchErrorState(errorMessage: "Failure fetching"));
        }

      }
}
