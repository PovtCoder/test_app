import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/user/state.dart';
import 'package:test_app/bloc/user/user_bloc.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state.user == null) {
        return const Center(child: CircularProgressIndicator());
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (state.user!.photos != null)
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 1.5,
              child: PageView(
                children: List.generate(
                  state.user!.photos!.length,
                  (index) => Image.network(
                    state.user!.photos![index].url!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.user!.name!,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('E-mail: ${state.user!.name}'),
                Text('Address: ${state.user!.address}'),
                Text('Phone: ${state.user!.phone}'),
                Text('Site: ${state.user!.website}'),
                Text('Company: ${state.user!.company}'),
              ],
            ),
          ),
        ],
      );
    });
  }
}
