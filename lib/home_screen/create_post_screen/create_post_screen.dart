import 'package:flutter/material.dart';
import 'package:myposts/home_screen/models/post.dart';

class CreatePostScreen extends StatelessWidget {
  static const String routeName = '/PostDetailScreen';

  static void navigateTo(BuildContext context, Post post) {
    Navigator.of(context).pushNamed(routeName, arguments: post);
  }
  final TextEditingController addTitle;
  final TextEditingController addDescription;
  final Post post;
  CreatePostScreen({
    Key? key,
    required this.post,
  }) : addDescription = TextEditingController(text: post.description) ,
        addTitle = TextEditingController(text: post.description) ,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Post"),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        /*child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Padding(
              padding: const EdgeInsets.all(16.0),
              child : TextField(
                controller: addTitle,
                decoration: const InputDecoration(
                  labelText: 'Add title',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child : TextField(
                controller: addDescription,
                decoration: const InputDecoration(
                  labelText: 'Add description',
                ),
              ),
            ),
            //Text(post.description),
            const Spacer(),
            Center(
              child: BlocConsumer<CreateBloc, CreateState>(
                listener: (context, state) {
                  if (state.status == CreateStatus.success) {
                    _showSnackBar(context, 'New post has been added');
                    Navigator.of(context).pop();
                  } else if (state.status == CreateStatus.error) {
                    _showSnackBar(context, state.error);
                  }
                },
                builder: (context, state) {
                  switch (state.status) {
                    case CreateStatus.loading:
                      return const CircularProgressIndicator();
                    default:
                      String enteredTitle = addTitle.text;
                      String enteredDescription = addDescription.text;
                      post.title = enteredTitle;
                      post.description = enteredDescription;
                      return _buildButton(context);
                  }
                },
              ),
            ),
          ],
        ),*/
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _onRegister(context),
      child: const Text('Add'),
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
    //BlocProvider.of<CreateBloc>(context).add(new Post(id: '', title: '', description: ''));
  }
}