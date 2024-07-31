import 'package:dartz/dartz.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:my_app/features/domain/entities/conversation_user_entity.dart';

abstract class ConversationUserRepository {
  Future<Either<Failure, List<ConversationUserEntity>>> getAllUsers();
  Future<Either<Failure, List<ConversationUserEntity>>> getUsersByGroupId(String groupId);
  Future<Either<Failure, ConversationUserEntity>> getUserById(int id);
  Future<Either<Failure, void>> addUser(ConversationUserEntity user);
  Future<Either<Failure, void>> updateUser(ConversationUserEntity user);
  Future<Either<Failure, void>> deleteUser(int id);
}
