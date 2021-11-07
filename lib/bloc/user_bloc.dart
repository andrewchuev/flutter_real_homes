import 'package:real_homes/bloc/user_event.dart';
import 'package:real_homes/bloc/user_state.dart';
import 'package:real_homes/models/post.dart';
import 'package:real_homes/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  final PostsRepository postsRepository;


  PostBloc({required this.postsRepository}) : super(PostEmptyState());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is PostLoadEvent) {
      yield PostLoadingState();
      try {
        final List<Post> _loadedPostList = await postsRepository.getAllPosts();
        yield PostLoadedState(loadedPost: _loadedPostList);
      } catch (_) {
        yield PostErrorState();
      }
    } else if (event is PostClearEvent) {
      yield PostEmptyState();
    }
  }

}