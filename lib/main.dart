import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myposts/home_screen/edit_bloc/edit_bloc.dart';
import 'package:myposts/home_screen/edit_post_screen/edit_post_screen.dart';
import 'package:myposts/home_screen/data_sources/api_posts_data_source.dart';
import 'package:myposts/home_screen/home_screen.dart';
import 'package:myposts/home_screen/models/post.dart';
import 'package:myposts/home_screen/post_detail_screen/post_detail_screen.dart';
import 'package:myposts/home_screen/repository/posts_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

//import 'firebase_options.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runZonedGuarded<Future<void>>(() async {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      final List<dynamic> errorAndStacktrace = pair;
      await FirebaseCrashlytics.instance.recordError(
        errorAndStacktrace.first,
        errorAndStacktrace.last,
      );
    }).sendPort);
    const apiBaseUrl = String.fromEnvironment('API_BASE_URL', defaultValue: 'valid');
    debugPrint('API_BASE_URL: $apiBaseUrl');
    runApp(MyApp());
  }, FirebaseCrashlytics.instance.recordError);
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
