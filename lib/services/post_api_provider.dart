import 'dart:convert';
import 'package:real_homes/models/post.dart';
import 'package:http/http.dart' as http;


class PostProvider {
  Future<List<Post>> getPosts() async {
    const uri = 'https://realhomes.reslab.pro/wp-json/reslab/v1/properties';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      final List<dynamic> postJson = json.decode(response.body);
      return postJson.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching posts');
    }
  }
}