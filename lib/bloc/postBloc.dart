import 'dart:io';

import 'package:blockp/bloc/todoEvent.dart';
import 'package:blockp/bloc/todoState.dart';
import 'package:blockp/data/exceptions.dart';
import 'package:blockp/data/post.dart';
import 'package:blockp/service/postservice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvents, PostState> {
  PostService postService;
  late List<Posts> posts;

  PostBloc({required this.postService}) : super(PostInitState());

  @override
  Stream<PostState> mapEventToState(PostEvents event) async* {
    switch (event) {
      case PostEvents.fetchAlbum:
        yield PostLoading();
        try {
          posts = await postService.getPostList();
          yield PostLoaded(posts: posts);
        } on HttpException {
          yield PostListError(
              error: NoServiceFoundException(message: "No Service Found"));
        } on FormatException {
          yield PostListError(
              error:
                  InvalidFormatException(message: "Invalid Response Formate"));
        } catch (e) {
          yield PostListError(
              error: UnknownException(message: "UnknownException"));
        }
        break;
    }
  }
}
