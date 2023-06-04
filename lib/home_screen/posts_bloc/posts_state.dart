part of 'posts_bloc.dart';

enum PostsStatus {
  empty,
  loading,
  success,
  error,
}

class PostsState {
  final PostsStatus status;
  final List<Post> posts;
  final String error;

  PostsState({
    this.status = PostsStatus.empty,
    this.posts = const [],
    this.error = '',
  });

  PostsState copyWith({
    PostsStatus? status,
    List<Post>? posts,
    String? error,
  }) {
    return PostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      error: error ?? this.error,
    );
  }
}