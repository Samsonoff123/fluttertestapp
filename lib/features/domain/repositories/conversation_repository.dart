import 'package:dartz/dartz.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:my_app/features/conversations/domain/entities/conversation_entity.dart';

abstract class ConversationRepository {
  Future<Either<Failure, List<ConversationEntity>>> getAllConversations();
  Future<Either<Failure, ConversationEntity>> getConversationById(int id);
  Future<Either<Failure, void>> addConversation(ConversationEntity conversation);
  Future<Either<Failure, void>> updateConversation(ConversationEntity conversation);
  Future<Either<Failure, void>> deleteConversation(int id);
}
