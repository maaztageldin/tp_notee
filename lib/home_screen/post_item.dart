import 'package:flutter/material.dart';


import 'models/post.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final VoidCallback? onTap;

  const PostItem({
    Key? key,
    required this.post,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title),
      subtitle: Text(post.description),
      //leading: Container(
        //height: 50,
        //width: 50,
       /* decoration: const BoxDecoration(
          color: Colors.lightBlue,
          shape: BoxShape.circle,
        ),*/
        /*child: Center(
          child: BlocBuilder<EditBloc, EditState>(
            buildWhen: (previous, next) {
              final previousOccurrences = previous.posts.where((element) => element.id == post.id).length;
              final nextOccurrences = next.posts.where((element) => element.id == post.id).length;

              return previousOccurrences != nextOccurrences;
            },
            builder: (context, state) {
              debugPrint('Building item ${post.title}');
              final products = state.posts;
              final occurrences = products.where((element) => element.id == post.id).length;
              return Text(
                '$occurrences',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
              );
            },
          ),
        ),*/
      //),
      onTap: onTap,
    );
  }
}