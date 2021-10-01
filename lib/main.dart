import 'package:blockp/service/postservice.dart';
import 'package:blockp/ui/PostScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/postBloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(
          create: (context) => PostBloc(postService: PostServiceImp()),
        ),
      ],
      child: MaterialApp(
        title: "Bloc Patter",
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: PostScreen(),
      ),
    );
  }
}
