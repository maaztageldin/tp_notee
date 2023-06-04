part of 'create_bloc.dart';

enum CreateStatus {
  empty,
  loading,
  success,
  error,
}

class CreateState {
  final CreateStatus status;
  final List<Post> posts;
  final String error;

  CreateState({
    this.status = CreateStatus.empty,
    this.posts = const [],
    this.error = '',
  });

  CreateState copyWith({
    CreateStatus? status,
    List<Post>? posts,
    String? error,
  }) {
    return CreateState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      error: error ?? this.error,
    );
  }
}