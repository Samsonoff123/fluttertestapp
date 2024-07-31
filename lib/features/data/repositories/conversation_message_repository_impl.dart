import 'package:dartz/dartz.dart';
import 'package:my_app/core/error/exceptions.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:my_app/features/messages/data/datasources/conversation_message_local_data_source.dart';
import 'package:my_app/features/messages/domain/entities/conversation_message_entity.dart';
import 'package:my_app/features/messages/domain/repositories/conversation_message_repository.dart';

class ConversationMessageRepositoryImpl implements ConversationMessageRepository {
  final ConversationMessageLocalDataSource localDataSource;

  ConversationMessageRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<ConversationMessageEntity>>> getAllMessages() async {
    try {
      final messages = await localDataSource.getAllMessages();
      return Right(messages);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<ConversationMessageEntity>>> getMessagesByConversationId(String conversationId) async {
    try {
      final messages = await localDataSource.getMessagesByConversationId(conversationId);
      return Right(messages);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, ConversationMessageEntity>> getMessageById(int id) async {
    try {
      final message = await localDataSource.getMessageById(id);
      return Right(message);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addMessage(ConversationMessageEntity message) async {
    try {
      await localDataSource.addMessage(message);
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateMessage(ConversationMessageEntity message) async {
    try {
      await localDataSource.updateMessage(message);
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteMessage(int id) async {
    try {
      await localDataSource.deleteMessage(id);
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
