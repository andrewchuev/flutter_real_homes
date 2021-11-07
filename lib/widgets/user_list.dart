import 'package:real_homes/bloc/user_bloc.dart';
import 'package:real_homes/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostEmptyState) {
          return Center(
            child: Text(
              'No data received. Press button "Load"',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }

        if (state is PostLoadingState) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is PostLoadedState) {
          return ListView.builder(
            itemCount: state.loadedPost.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.white : Colors.blue[50],
              child: ListTile(
                leading: Text(
                  'ID: ${state.loadedPost[index].id}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                title: Column(
                  children: <Widget>[
                    Text(
                      '${state.loadedPost[index].title}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Email: ${state.loadedPost[index].content}',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Image.network(state.loadedPost[index].attachement),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (state is PostErrorState) {
          return Center(
            child: Text(
              'Error fetching users',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return Text('');
      },
    );
  }
}
