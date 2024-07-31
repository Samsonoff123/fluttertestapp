import 'package:dartz/dartz.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:my_app/features/messages/domain/entities/message_entity.dart';

abstract class MessageRepository {
  Future<Either<Failure, List<MessageEntity>>> getAllMessages();
  Future<Either<Failure, List<MessageEntity>>> getMessagesBySenderPhoneNumber(String senderPhoneNumber);
  Future<Either<Failure, List<MessageEntity>>> getMessagesByTargetPhoneNumber(String targetPhoneNumber);
  Future<Either<Failure, MessageEntity>> getMessageById(int id);
  Future<Either<Failure, void>> addMessage(MessageEntity message);
  Future<Either<Failure, void>> updateMessage(MessageEntity message);
  Future<Either<Failure, void>> deleteMessage(int id);
}
