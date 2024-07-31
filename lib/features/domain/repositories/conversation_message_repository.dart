import 'package:dartz/dartz.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:my_app/features/messages/domain/entities/conversation_message_entity.dart';

abstract class ConversationMessageRepository {
  Future<Either<Failure, List<ConversationMessageEntity>>> getAllMessages();
  Future<Either<Failure, List<ConversationMessageEntity>>> getMessagesByConversationId(String conversationId);
  Future<Either<Failure, ConversationMessageEntity>> getMessageById(int id);
  Future<Either<Failure, void>> addMessage(ConversationMessageEntity message);
  Future<Either<Failure, void>> updateMessage(ConversationMessageEntity message);
  Future<Either<Failure, void>> deleteMessage(int id);
}
