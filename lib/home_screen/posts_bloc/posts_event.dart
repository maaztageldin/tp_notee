part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent {}


class GetAllPosts extends PostsEvent {
  final int count;

  GetAllPosts(this.count);
}