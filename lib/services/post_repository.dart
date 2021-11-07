import 'package:real_homes/models/post.dart';
import 'package:real_homes/services/post_api_provider.dart';

class PostsRepository {
  final PostProvider _postProvider = PostProvider();
  Future<List<Post>> getAllPosts() => _postProvider.getPosts();
}