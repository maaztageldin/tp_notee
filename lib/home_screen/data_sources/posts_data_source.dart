import 'package:myposts/home_screen/models/post.dart';

abstract class PostsDataSource {
  Future<List<Post>> getPosts();
}