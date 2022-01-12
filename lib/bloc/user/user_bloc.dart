import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/user/events.dart';
import 'package:test_app/bloc/user/state.dart';
import 'package:test_app/networking.dart/networking.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<UserLoaded>(_onUserLoaded);
  }

  Future<void> _onUserLoaded(UserLoaded event, Emitter<UserState> emit) async {
    var user = await Networking.instance.api.getUser(1);
    user.photos = (await Networking.instance.api.getPhotos()).sublist(0, 2);

    emit(state.copyWith(user: user));
  }
}
