import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/post.dart';

part 'create_event.dart';
part 'create_state.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState> {
  CreateBloc() : super(CreateState()) {
    on<CreatePostScreen>((event, emit) async {
      emit(state.copyWith(status: CreateStatus.loading));
      final post = event.post;
      await Future.delayed(const Duration(seconds: 4));
      try {
        emit(
          state.copyWith(
            status: CreateStatus.success,
            posts: [
              ...state.posts,
              post,
            ],
          ),
        );
      } catch (error) {
        emit(state.copyWith(status: CreateStatus.error, error: 'Maaz you have an error while creating this post A1'));
      }
    });
  }
}
