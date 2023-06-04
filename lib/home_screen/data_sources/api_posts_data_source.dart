import '../models/post.dart';
import 'posts_data_source.dart';

class ApiPostsDataSource extends PostsDataSource {
  @override
  Future<List<Post>> getPosts() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(10, (index) {
      return Post(
        id: '$index',
        title : 'Title $index',
        description: 'Description $index',
      );
    });
  }
}