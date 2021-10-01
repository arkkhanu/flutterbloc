import 'package:blockp/data/post.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


abstract class PostState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostInitState extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Posts> posts;
  PostLoaded({required this.posts});
}

class PostListError extends PostState {
  final error;
  PostListError({this.error});
}