part of 'create_bloc.dart';

@immutable
abstract class CreateEvent {}

class CreatePostScreen extends CreateEvent {
  final Post post;

  CreatePostScreen(this.post);
}
