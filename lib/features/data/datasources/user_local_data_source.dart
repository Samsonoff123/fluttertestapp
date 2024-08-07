import 'package:sqflite/sqflite.dart';
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
  final Database db;

  UserLocalDataSourceImpl({required this.db});

  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      final List<Map<String, dynamic>> maps = await db.query('users');
      return List.generate(maps.length, (i) {
        return UserModel.fromMap(maps[i]);
      });
    } catch (e) {
      print('Error fetching all users: $e'); // Добавим отладочный вывод
      throw CacheException();
    }
  }

  @override
  Future<UserModel?> getUserById(int id) async {
    try {
      final List<Map<String, dynamic>> maps = await db.query(
        'users',
        where: 'id = ?',
        whereArgs: [id],
      );
      if (maps.isNotEmpty) {
        return UserModel.fromMap(maps.first);
      }
      return null;
    } catch (e) {
      print('Error fetching user by ID: $e'); // Добавим отладочный вывод
      throw CacheException();
    }
  }

  @override
  Future<void> addUser(UserModel user) async {
    try {
      await db.insert(
        'users',
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('Error adding user: $e'); // Добавим отладочный вывод
      throw CacheException();
    }
  }

  @override
  Future<void> updateUser(UserModel user) async {
    try {
      await db.update(
        'users',
        user.toMap(),
        where: 'id = ?',
        whereArgs: [user.id],
      );
    } catch (e) {
      print('Error updating user: $e'); // Добавим отладочный вывод
      throw CacheException();
    }
  }

  @override
  Future<void> deleteUser(int id) async {
    try {
      await db.delete(
        'users',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Error deleting user: $e'); // Добавим отладочный вывод
      throw CacheException();
    }
  }
}
