import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/presentation/blocs/counter_cubit.dart';
import 'package:my_app/features/presentation/blocs/user_bloc/user_bloc.dart';

class ConversationsScreen extends StatelessWidget {
  const ConversationsScreen();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ConversationsScreen page'
              ),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UserLoaded) {
                    return Center(child: Text('User: ${state.user.fullName}'));
                  } else if (state is UserError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                  return const Center(child: Text('No data available'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
