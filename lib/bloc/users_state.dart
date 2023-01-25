part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersLoadingState extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoadedState extends UsersState {
  final List<User> users;
  const UsersLoadedState(this.users);

  @override
  List<Object> get props => [users];
}

class UsersErrorState extends UsersState {
  final String e;

  const UsersErrorState(this.e);
  @override
  List<Object> get props => [e];
}
