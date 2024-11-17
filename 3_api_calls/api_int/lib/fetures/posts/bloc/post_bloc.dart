import 'dart:async';
import 'dart:developer';

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
    Dio layer = Dio();
    emit(PostFetchLoadingState());
    try {
      Response response = await layer.get("https://jsonplaceholder.typicode.com/posts");
      final List  data = response.data  as List;
      // log(data.toString());
      List<PostModel> finalData = data.map((e){
        return PostModel(
          id: e['id'],
          userId: e['userId'],
          title: e['title'],
          body: e['body'],
        );
      }).toList();
      // log(finalData.toString());
      emit(PostFetheingSuccessState(postData: finalData));
      log("Done State Updating");
    } catch (e) {
      emit(PostFetchErrorState(errorMessage: e.toString()));
      // log(e.toString());
    }
  }
}
