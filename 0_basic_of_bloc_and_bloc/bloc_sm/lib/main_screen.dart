
import 'package:bloc_sm/view/bloc/home_screen_using_bloc.dart';
import 'package:bloc_sm/view/cubit/home_screen_using_cubit.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold( 

        body: Center( 
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [ 

              Row(
                children: [
                  Text("By using the cubit :"),
                  FloatingActionButton(
                    onPressed: (){
                    Navigator.of(context).push( 
                      MaterialPageRoute(builder: (_)=>MyHomePageCubit(title: "Cubit"))
                    );
                  },
                    child: Text("go Cubit"),
                  
                  )
                ],
              ),
               Row(
                children: [
                  Text("By using the Bloc :"),
                  FloatingActionButton(onPressed: (){
                    Navigator.of(context).push( 
                      MaterialPageRoute(builder: (_)=>MyHomePageBloc(title: "Bloc"))
                    );
                  },
                    child: Text("go Bloc"),
                  )
                ],
              )

            ],
          ),
        ),
      );
  }
}