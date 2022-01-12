import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/user/events.dart';
import 'package:test_app/bloc/user/user_bloc.dart';
import 'package:test_app/components/user_info.dart';
import 'package:test_app/screens/user_edit_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserEditScreen()),
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: BlocProvider(
        create: (_) => UserBloc()..add(UserLoaded()),
        child: const UserInfo(),
      ),
    );
  }
}
