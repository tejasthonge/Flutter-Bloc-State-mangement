import 'package:api_int/fetures/home/home_page.dart';
import 'package:api_int/fetures/posts/view/post_page.dart';
import 'package:flutter/material.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      home:PostPage() ,
    );
  }
}