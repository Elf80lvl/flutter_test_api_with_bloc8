import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_api_with_bloc8/bloc/users_bloc.dart';
import 'package:flutter_test_api_with_bloc8/services/network.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBloc(RepositoryProvider.of<Network>(context))
        ..add(LoadUsersEvent()),
      child: Scaffold(
        body: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is UsersLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is UsersLoadedState) {
              return Center(
                child: ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.users[index].name),
                        subtitle: Text(state.users[index].email),
                      );
                    }),
              );
            }

            if (state is UsersErrorState) {
              return Center(
                child: Text(state.e),
              );
            }
            return Container();
          },
        ),
        floatingActionButton: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                BlocProvider.of<UsersBloc>(context).add(LoadUsersEvent());
              },
              child: const Icon(Icons.refresh),
            );
          },
        ),
      ),
    );
  }
}
