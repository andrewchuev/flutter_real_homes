import 'package:real_homes/bloc/user_bloc.dart';
import 'package:real_homes/services/user_repository.dart';
import 'package:real_homes/widgets/action_buttons.dart';
import 'package:real_homes/widgets/user_list.dart';
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
          title: Text('Posts List'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ActionButtons(),
            Expanded(child: PostList()),
          ],
        ),
      ),
    );
  }
}
