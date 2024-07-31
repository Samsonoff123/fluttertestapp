import 'package:objectbox/objectbox.dart';
import 'package:my_app/features/data/models/user_model.dart';
import 'package:my_app/core/error/exceptions.dart';

abstract class UserLocalDataSource {
  Future<List<UserModel>> getAllUsers();
  Future<UserModel?> getUserById(int id);
  Future<void> addUser(UserModel user);
  Future<void> updateUser(UserModel user);
  Future<void> deleteUser(int id);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final Store store;

  UserLocalDataSourceImpl({required this.store});

  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      final box = store.box<UserModel>();
      return box.getAll();
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<UserModel?> getUserById(int id) async {
    try {
      final box = store.box<UserModel>();
      return box.get(id);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> addUser(UserModel user) async {
    try {
      final box = store.box<UserModel>();
      box.put(user);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> updateUser(UserModel user) async {
    try {
      final box = store.box<UserModel>();
      box.put(user);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> deleteUser(int id) async {
    try {
      final box = store.box<UserModel>();
      box.remove(id);
    } catch (e) {
      throw CacheException();
    }
  }
}
