import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/post/events.dart';
import 'package:test_app/bloc/post/state.dart';
import 'package:test_app/networking.dart/networking.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<PostLoaded>(_onPostLoaded);
  }

  Future<void> _onPostLoaded(PostLoaded event, Emitter<PostState> emit) async {
    var posts = await Networking.instance.api.getPosts();

    emit(state.copyWith(
      posts: posts,
    ));
  }
}
