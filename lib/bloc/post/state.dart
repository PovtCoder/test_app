import 'package:equatable/equatable.dart';
import 'package:test_app/entities/post.dart';

class PostState extends Equatable {
  final List<Post>? posts;

  const PostState({this.posts});

  PostState copyWith({
    List<Post>? posts,
  }) {
    return PostState(
      posts: posts ?? this.posts,
    );
  }

  @override
  List<Object?> get props => [posts];
}
