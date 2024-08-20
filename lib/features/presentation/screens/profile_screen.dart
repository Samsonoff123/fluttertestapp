import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/presentation/blocs/auth_cubit.dart';
import 'package:my_app/services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _logout() async {
      await _authService.logout();
      context.read<AuthCubit>().emit(AuthUnauthenticated());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logged out')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _logout,
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
