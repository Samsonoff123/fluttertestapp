import 'package:dartz/dartz.dart';
import 'package:my_app/core/error/exceptions.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:my_app/features/data/datasources/conversation_user_local_data_source.dart';
import 'package:my_app/features/domain/entities/conversation_user_entity.dart';
import 'package:my_app/features/domain/repositories/conversation_user_repository.dart';

class ConversationUserRepositoryImpl implements ConversationUserRepository {
  final ConversationUserLocalDataSource localDataSource;

  ConversationUserRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<ConversationUserEntity>>> getAllUsers() async {
    try {
      final users = await localDataSource.getAllUsers();
      return Right(users);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<ConversationUserEntity>>> getUsersByGroupId(String groupId) async {
    try {
      final users = await localDataSource.getUsersByGroupId(groupId);
      return Right(users);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, ConversationUserEntity>> getUserById(int id) async {
    try {
      final user = await localDataSource.getUserById(id);
      return Right(user);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addUser(ConversationUserEntity user) async {
    try {
      await localDataSource.addUser(user);
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(ConversationUserEntity user) async {
    try {
      await localDataSource.updateUser(user);
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
