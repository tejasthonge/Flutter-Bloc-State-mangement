import 'dart:developer';

import 'package:api_int/fetures/posts/models/post_data_ui_mode.dart';
import 'package:dio/dio.dart';

class PostRepository {
  static Future<List<PostModel>> fetchPost() async {
    Dio layer = Dio();

    try {
      Response response =
          await layer.get("https://jsonplaceholder.typicode.com/posts");
      final List data = response.data as List;
      // log(data.toString());
      List<PostModel> finalData = data.map((e) {
        return PostModel(
          id: e['id'],
          userId: e['userId'],
          title: e['title'],
          body: e['body'],
        );
      }).toList();
      return finalData;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
