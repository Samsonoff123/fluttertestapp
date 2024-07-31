import 'package:my_app/features/domain/repositories/user_repository.dart';
import 'package:my_app/features/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/core/error/failures.dart';

class GetUserByIdUseCase {
  final UserRepository repository;

  GetUserByIdUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(int id) async {
    return await repository.getUserById(id);
  }
}
