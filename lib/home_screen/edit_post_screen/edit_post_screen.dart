import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myposts/home_screen/edit_bloc/edit_bloc.dart';
import 'package:myposts/home_screen/post_item.dart';

class EditPostScreen extends StatelessWidget {
  static const String routeName = '/EditScreen';

  static void navigateTo(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  const EditPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit post'),
      ),
      body: BlocBuilder<EditBloc, EditState>(
        builder: (context, state) {
          final posts = state.posts;

          if (posts.isEmpty) {
            return const Center(
              child: Text('Votre panier est vide'),
            );
          }

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return PostItem(post: post);
            },
          );
        },
      ),
    );
  }
}