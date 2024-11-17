import 'package:api_int/fetures/posts/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  // final PostBloc postBloc = PostBloc();

  @override
  void initState() {
    super.initState();
    // context.read<PostBloc>().add(PostInitialFethEvent());  //this
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostBloc>(
      
      create: (context) => PostBloc()..add(PostInitialFethEvent()),
      
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Posts"),
        ),

        body: BlocConsumer<PostBloc, PostState>(
          // bloc: postBloc,
          buildWhen: (previous, current) => current is !PostActionState,
          listener: (context, state) {

            if(state is PostFetchErrorState){
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case  PostFetchLoadingState :
                return const  Center(
                  child: CircularProgressIndicator(),
                );

              case  PostFetheingSuccessState:
              final sucState = state as PostFetheingSuccessState;
              final posts = sucState.postData;
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder:(context ,index){
                  final post =posts[index];
                  return ListTile(
                    title: Text(post.title),
                    leading: Text(
                      post.id.toString()
                    ),
                  );
                } );

              case PostFetchErrorState:
                final errorState = state as PostFetchErrorState;
                return  Center(
                  child: Text(state.errorMessage),
                );
              default:
                return  Container(
                  width: double.infinity,
                  color: Colors.yellow,
                  height: MediaQuery.sizeOf(context).height,
                  child: Center( 
                    child: Text(
                      "Undefined state",
                      style: TextStyle( 
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
