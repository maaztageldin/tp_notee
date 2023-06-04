import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myposts/home_screen/models/post.dart';
import '../edit_bloc/edit_bloc.dart';

class PostDetailScreen extends StatelessWidget {
  static const String routeName = '/PostDetailScreen';


  static void navigateTo(BuildContext context, Post post) {
    Navigator.of(context).pushNamed(routeName, arguments: post);
  }
  final TextEditingController textEditingController;

  final Post post;
  PostDetailScreen({
    Key? key,
    required this.post,
  }) : textEditingController = TextEditingController(text: post.description), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit post"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(16.0),
                  child : TextField(
                      controller: textEditingController,
                      decoration: const InputDecoration(
                        labelText: 'Editing ',
                      ),
                  ),
            ),
            //Text(post.description),

            const Spacer(),
            Center(
              child: BlocConsumer<EditBloc, EditState>(
                listener: (context, state) {
                  if (state.status == EditStatus.updated) {
                    _showSnackBar(context, 'Post has been modified');
                    Navigator.of(context).pop();
                  } else if (state.status == EditStatus.error) {
                    _showSnackBar(context, state.error ?? '');
                  }
                },
                builder: (context, state) {
                  switch (state.status) {
                    case EditStatus.loading:
                      return const CircularProgressIndicator();
                    default:
                      String enteredText = textEditingController.text;
                      post.description = enteredText;
                      return _buildButton(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _onRegister(context),
      child: const Text('Register'),
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  void _onRegister(BuildContext context) {
    BlocProvider.of<EditBloc>(context).add(EditPost(post));
  }
}