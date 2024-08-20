import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthEvent {}

class AuthCheck extends AuthEvent {}

class AuthLoggedOut extends AuthEvent {}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthUnauthenticated extends AuthState {}

class AuthLoading extends AuthState {}

class AuthCubit extends Cubit<AuthState> {
  final FlutterSecureStorage _storage;

  AuthCubit(this._storage) : super(AuthInitial()) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    emit(AuthLoading());
    final accessToken = await _storage.read(key: 'access_token');
    if (accessToken != null && accessToken.isNotEmpty) {
      emit(AuthAuthenticated());
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'access_token');
  }

  Future<void> logOut() async {
    emit(AuthLoading());
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
    await _storage.delete(key: 'expires_in');
    await _storage.delete(key: 'token_type');
    emit(AuthUnauthenticated());
  }
}
