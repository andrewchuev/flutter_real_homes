import 'package:real_homes/bloc/post_bloc.dart';
import 'package:real_homes/services/post_repository.dart';
import 'package:real_homes/widgets/post_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final postsRepository = PostsRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostBloc>(
      create: (context) => PostBloc(postsRepository: postsRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Apartments'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: PostList()),
          ],
        ),
      ),
    );
  }
}
