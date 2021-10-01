import 'dart:convert';
import 'dart:developer';

import 'package:blockp/data/post.dart';
import 'package:http/http.dart' as http;

abstract class PostService {
  Future<List<Posts>> getPostList();
}

class PostServiceImp implements PostService {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String _GET_PostS = '/Posts';

  @override
  Future<List<Posts>> getPostList() async {
    // debugger();
    http.Response response = await http.get(Uri.parse(_baseUrl+_GET_PostS),
        headers: {
          "content-type": "application/json",
        });
    // debugger();
    List<Posts> posts = Posts.parseList(jsonDecode(response.body));
    return posts;
  }
}
