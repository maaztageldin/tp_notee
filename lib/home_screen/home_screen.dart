import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myposts/home_screen/models/post.dart';
import 'package:myposts/home_screen/post_detail_screen/post_detail_screen.dart';
import 'package:myposts/home_screen/posts_bloc/posts_bloc.dart';
import 'package:myposts/home_screen/repository/posts_repository.dart';
import 'package:myposts/home_screen/post_item.dart';

import 'create_post_screen/create_post_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc(
        repository: RepositoryProvider.of<PostsRepository>(context),
      )..add(GetAllPosts(10)),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Posts '),
            ),
            body: BlocBuilder<PostsBloc, PostsState>(
              builder: (context, state) {
                switch (state.status) {
                  case PostsStatus.empty:
                    return const SizedBox();
                  case PostsStatus.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case PostsStatus.error:
                    return Center(
                      child: Text(state.error),
                    );
                  case PostsStatus.success:
                    final posts = state.posts;

                    if (posts.isEmpty) {
                      return const Center(
                        child: Text('no posts'),
                      );
                    }

                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return PostItem(
                          post: post,
                          onTap: () => _onPostTap(context, post),
                        );
                      },
                    );
                }
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => _onAddPostToList(context, Post(id: '', title: '', description: '')),
            ),
          );
        },
      ),
    );
  }

  /*void _onCartTap(BuildContext context) {
    CartScreen.navigateTo(context);
  }*/
/* should make a same bouttom which brings us to a post edditing page */
  void _onAddPostToList(BuildContext context, Post post) {
    //var post = Post(id: '', title: '', description: '');
    CreatePostScreen.navigateTo(context,post);
  }

  void _onPostTap(BuildContext context, Post post) {
    PostDetailScreen.navigateTo(context, post);
  }
}
