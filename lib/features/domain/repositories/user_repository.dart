import 'package:dartz/dartz.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:my_app/features/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUserById(int id);
  Future<Either<Failure, List<UserEntity>>> getAllUsers();
  Future<Either<Failure, void>> addUser(UserEntity user);
  Future<Either<Failure, void>> updateUser(UserEntity user);
  Future<Either<Failure, void>> deleteUser(int id);
}
