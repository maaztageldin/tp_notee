import 'package:flutter/material.dart';
//import 'package:posts/home_screen/repository/posts_repository.dart';

class PostsRepositoryProvider extends InheritedWidget {
  const PostsRepositoryProvider({
    Key? key,
    required Widget child,
    required this.postsRepository,
  }) : super(key: key, child: child);

  final PostsRepositoryProvider postsRepository;

  static PostsRepositoryProvider of(BuildContext context) {
    final PostsRepositoryProvider? result = context.dependOnInheritedWidgetOfExactType<PostsRepositoryProvider>();
    assert(result != null, 'No PostRepositoryProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(PostsRepositoryProvider old) {
    return true;
  }
}