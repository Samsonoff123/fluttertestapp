import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/injection_container.dart'; // Убедитесь, что путь верный
import 'package:my_app/features/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:my_app/features/presentation/blocs/user_bloc/user_event.dart';
import 'package:my_app/features/presentation/blocs/user_bloc/user_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator(); // Инициализация зависимостей
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserBloc>()..add(GetUserByIdEvent(1)), // Создание и добавление события
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator()); // Добавление Center для выравнивания
          } else if (state is UserLoaded) {
            return Center(child: Text('User: ${state.user.fullName}')); // Добавление Center для выравнивания
          } else if (state is UserError) {
            return Center(child: Text('Error: ${state.message}')); // Добавление Center для выравнивания
          }
          return const Center(child: Text('No data available')); // По умолчанию
        },
      ),
    );
  }
}
