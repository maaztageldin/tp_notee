part of 'edit_bloc.dart';

@immutable
abstract class EditEvent {}


class EditPost extends EditEvent {
  final Post post;

  EditPost(this.post);
}
