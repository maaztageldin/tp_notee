part of 'edit_bloc.dart';

enum EditStatus {
  initial,
  loading,
  updated,
  error,
}

class EditState {
  final EditStatus status;
  final List<Post> posts;
  final String error;

  EditState({
    this.status = EditStatus.initial,
    this.posts = const [],
    this.error = '',
  });

  EditState copyWith({
    EditStatus? status,
    List<Post>? posts,
    String? error,
  }) {
    return EditState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      error: error ?? this.error,
    );
  }
}