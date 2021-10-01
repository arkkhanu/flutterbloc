import 'package:flutter/cupertino.dart';

@immutable
abstract class TodoEvent {}

class TodoFetch extends TodoEvent {}

class TodoDetailEvent extends TodoEvent {}

class LoginEvent extends TodoEvent{}


enum PostEvents{
  fetchAlbum
}
