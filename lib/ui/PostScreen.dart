import 'package:blockp/bloc/postBloc.dart';
import 'package:blockp/bloc/todoEvent.dart';
import 'package:blockp/bloc/todoState.dart';
import 'package:blockp/data/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  _loadPosts() async {
    BlocProvider.of<PostBloc>(context).add(PostEvents.fetchAlbum);
    // context.bloc<PostBloc>().add(PostEvents.fetchPost);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ABC"),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostListError) {
              final error = state.error;
              String message = "${error.message} \nTap to Retry";
              return ElevatedButton(
                  onPressed: _loadPosts, child: Text(message));
            }
            if (state is PostLoaded) {
              List<Posts> _po = state.posts;
              return _list(_po);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      ],
    );
  }

  Widget _list(List<Posts> po) {
    return Expanded(
      child: ListView.builder(
        itemCount: po.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(po[index].title.toString()),
          subtitle: Text(po[index].body.toString()),
        ),
      ),
    );
  }
}
