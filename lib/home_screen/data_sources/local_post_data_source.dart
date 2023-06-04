import 'package:flutter/widgets.dart';
import 'package:myposts/home_screen/data_sources/posts_data_source.dart';
import 'package:myposts/home_screen/models/post.dart';


class LocalPostDataSource extends PostsDataSource {
  @override
  Future<List<Post>> getPosts() {
    debugPrint('Getting fruits from local data source');
    return Future.value([]);
  }
}