import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_api_with_bloc8/services/network.dart';

import '../models/user.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final Network _network;
  UsersBloc(this._network) : super(UsersLoadingState()) {
    on<LoadUsersEvent>((event, emit) async {
      emit(UsersLoadingState());

      //load users
      try {
        final users = await _network.getUsers();
        emit(UsersLoadedState(users));
      } catch (e) {
        emit(UsersErrorState(e.toString()));
      }

      //emit(UsersLoadedState());
    });
  }
}
