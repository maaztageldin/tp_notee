import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/post.dart';

part 'edit_event.dart';
part 'edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  EditBloc() : super(EditState()) {
    on<EditPost>((event, emit) async {
      emit(state.copyWith(status: EditStatus.loading));
      final post = event.post;
      await Future.delayed(const Duration(seconds: 2));
      try {
        emit(
          state.copyWith(
            status: EditStatus.updated,
            posts: [
              ...state.posts,
              post,
            ],
          ),
        );
      } catch (error) {
        emit(state.copyWith(status: EditStatus.error, error: 'Maaz you have an error while Editing this post A1'));
      }
    });
  }
}
