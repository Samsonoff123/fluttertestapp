import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_app/features/presentation/forms/login_form.dart';

class LoginWrapperScreen extends StatefulWidget {
  const LoginWrapperScreen({Key? key}) : super(key: key);

  @override
  State<LoginWrapperScreen> createState() => _LoginWrapperScreenState();
}

class _LoginWrapperScreenState extends State<LoginWrapperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: LoginForm(),
    );
  }
}
