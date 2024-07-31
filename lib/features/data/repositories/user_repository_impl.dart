import 'package:dartz/dartz.dart';
import 'package:my_app/core/error/exceptions.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:my_app/features/data/datasources/user_local_data_source.dart';
import 'package:my_app/features/domain/entities/user_entity.dart';
import 'package:my_app/features/domain/repositories/user_repository.dart';
import 'package:my_app/features/data/models/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUserById(int id);
  Future<Either<Failure, List<UserEntity>>> getAllUsers();
  Future<Either<Failure, void>> addUser(UserEntity user);
  Future<Either<Failure, void>> updateUser(UserEntity user);
  Future<Either<Failure, void>> deleteUser(int id);
}

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, UserEntity>> getUserById(int id) async {
    try {
      final userModel = await localDataSource.getUserById(id);
      if (userModel != null) {
        return Right(userModel.toEntity());
      } else {
        return Left(CacheFailure());
      }
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers() async {
    try {
      final userModels = await localDataSource.getAllUsers();
      final userEntities = userModels.map((model) => model.toEntity()).toList();
      return Right(userEntities);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addUser(UserEntity user) async {
    try {
      await localDataSource.addUser(UserModel.fromEntity(user));
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(UserEntity user) async {
    try {
      await localDataSource.updateUser(UserModel.fromEntity(user));
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser(int id) async {
    try {
      await localDataSource.deleteUser(id);
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
