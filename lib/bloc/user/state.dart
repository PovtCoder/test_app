import 'package:equatable/equatable.dart';
import 'package:test_app/entities/user.dart';

class UserState extends Equatable {
  final User? user;

  const UserState({this.user});

  UserState copyWith({
    User? user,
  }) {
    return UserState(
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [user];
}
