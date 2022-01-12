import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/post/post_bloc.dart';
import 'package:test_app/bloc/post/state.dart';

class PostsList extends StatelessWidget {
  const PostsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state.posts == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: List.generate(
                state.posts!.length,
                (index) => ListTile(
                  title: Text(state.posts![index].title!),
                  subtitle: Text(state.posts![index].body!),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
