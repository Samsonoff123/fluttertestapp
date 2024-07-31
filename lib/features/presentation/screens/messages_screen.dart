import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/presentation/blocs/counter_cubit.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('MessagesScreen page'),
              BlocBuilder<CounterCubit, int>(
                builder: (context, count) => Text('$count'),
              ),
              SizedBox(height: 16),
              FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () => context.read<CounterCubit>().increment(),
              ),
              const SizedBox(height: 16),
              FloatingActionButton(
                child: const Icon(Icons.remove),
                onPressed: () => context.read<CounterCubit>().decrement(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
