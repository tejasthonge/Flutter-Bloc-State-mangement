
import 'package:flutter/material.dart';
import 'package:shope_app/features/home/ui/home.dart';

void main(){

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    //here we douse not use the dependency injection
    
    return const MaterialApp( 

      home:  HomePage(),
    );
  }
}