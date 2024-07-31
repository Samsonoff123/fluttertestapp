import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/presentation/blocs/counter_cubit.dart';

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
              BlocBuilder<CounterCubit, int>(
                builder: (context, count) => Text('$count'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
