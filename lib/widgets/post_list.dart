import 'package:real_homes/bloc/post_bloc.dart';
import 'package:real_homes/bloc/post_event.dart';
import 'package:real_homes/bloc/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PostBloc postBloc = BlocProvider.of<PostBloc>(context);
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostEmptyState) {
          postBloc.add(PostLoadEvent());
        }

        if (state is PostLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PostLoadedState) {
          return ListView.builder(
            itemCount: state.loadedPost.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.white : Colors.blue[50],
              child: ListTile(
                leading: Image.network(state.loadedPost[index].attachement),
                title: Column(
                  children: <Widget>[
                    Text(
                      '${state.loadedPost[index].title}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      state.loadedPost[index].content.substring(1,100) + '...',
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (state is PostErrorState) {
          return const Center(
            child: Text(
              'Error fetching posts',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }

        return const Text('Posts not found');
      },
    );
  }
}
