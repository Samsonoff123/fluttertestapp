import 'package:dartz/dartz.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:my_app/features/message_type/domain/entities/conversation_message_type_entity.dart';

abstract class ConversationMessageTypeRepository {
  Future<Either<Failure, List<ConversationMessageTypeEntity>>> getAllMessageTypes();
  Future<Either<Failure, List<ConversationMessageTypeEntity>>> getMessageTypesByConversationId(String conversationId);
  Future<Either<Failure, ConversationMessageTypeEntity>> getMessageTypeById(int id);
  Future<Either<Failure, void>> addMessageType(ConversationMessageTypeEntity messageType);
  Future<Either<Failure, void>> updateMessageType(ConversationMessageTypeEntity messageType);
  Future<Either<Failure, void>> deleteMessageType(int id);
}
