import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myposts/home_screen/edit_bloc/edit_bloc.dart';
import 'package:myposts/home_screen/edit_post_screen/edit_post_screen.dart';
import 'package:myposts/home_screen/data_sources/api_posts_data_source.dart';
import 'package:myposts/home_screen/home_screen.dart';
import 'package:myposts/home_screen/models/post.dart';
import 'package:myposts/home_screen/post_detail_screen/post_detail_screen.dart';
import 'package:myposts/home_screen/repository/posts_repository.dart';


void main() {
  const apiBaseUrl = String.fromEnvironment('API_BASE_URL', defaultValue: 'valid');
  debugPrint('API_BASE_URL: $apiBaseUrl');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return RepositoryProvider(
      create: (context) => PostsRepository(
        remoteDataSource: ApiPostsDataSource(),
      ),
      child: BlocProvider(
        create: (context) => EditBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: const TextTheme(
              bodySmall: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ),
          routes: {
            '/': (context) => const HomeScreen(),
            EditPostScreen.routeName: (context) => const EditPostScreen(),
          },
          onGenerateRoute: (settings) {
            Widget content = const SizedBox.shrink();

            switch (settings.name) {
              case PostDetailScreen.routeName:
                final arguments = settings.arguments;
                if (arguments is Post) {
                  content = PostDetailScreen(post: arguments);
                }
                break;
            }

            return MaterialPageRoute(
              builder: (context) {
                return content;
              },
            );
          },
        ),
      ),
    );
  }
}