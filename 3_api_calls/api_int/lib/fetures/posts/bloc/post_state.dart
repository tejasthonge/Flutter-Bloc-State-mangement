part of 'post_bloc.dart';

@immutable
sealed class PostState {}

class PostActionState extends PostState{}

class PostInitial extends PostState {}
class PostFetchLoadingState extends PostState {}
class PostFetheingSuccessState extends PostState {
   List<PostModel> postData =[];
 PostFetheingSuccessState({required this.postData});
}
class PostFetchErrorState extends PostState {
  String errorMessage;
  PostFetchErrorState({required this.errorMessage});
}