import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_app/injection_container.dart';
import 'package:my_app/features/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:my_app/features/presentation/blocs/messages_cubit.dart';
import 'package:my_app/features/presentation/screens/wrappers/privat_wrapper_screen.dart';
import 'package:my_app/features/presentation/screens/wrappers/login_wrapper_screen.dart';
import 'package:my_app/features/presentation/blocs/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('Initializing dependencies...');
  await initLocator();

  final storage = FlutterSecureStorage();
  final authCubit = AuthCubit(storage);

  print('Dependencies initialized');

  runApp(MyApp(authCubit: authCubit));
}

class MyApp extends StatelessWidget {
  final AuthCubit authCubit;

  const MyApp({super.key, required this.authCubit});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<UserBloc>()..add(const GetUserByIdEvent(id: 1))),
        BlocProvider(create: (context) => MessagesCubit()),
        BlocProvider.value(value: authCubit),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          Widget initialScreen;

          if (state is AuthLoading) {
            initialScreen = const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is AuthAuthenticated) {
            initialScreen = PrivatWrapperScreen();
          } else {
            initialScreen = const LoginWrapperScreen();
          }

          return MaterialApp(
            title: 'Flutter Demo',
            home: initialScreen,
          );
        },
      ),
    );
  }
}
