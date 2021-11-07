import 'package:real_homes/bloc/user_bloc.dart';
import 'package:real_homes/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PostBloc postBloc = BlocProvider.of<PostBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(
          child: Text('Load'),
          onPressed: () {
            postBloc.add(PostLoadEvent());
          },
          color: Colors.green,
        ),
        SizedBox(width: 8.0),
        ElevatedButton(
          child: Text('Clear'),
          onPressed: () {
            postBloc.add(PostClearEvent());
          },
          //style: ButtonStyle(backgroundColor: Colors.red),
        ),
      ],
    );
  }
}