import 'package:dartz/dartz.dart';
import 'package:my_app/core/error/exceptions.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:my_app/features/message_type/data/datasources/conversation_message_type_local_data_source.dart';
import 'package:my_app/features/message_type/domain/entities/conversation_message_type_entity.dart';
import 'package:my_app/features/message_type/domain/repositories/conversation_message_type_repository.dart';

class ConversationMessageTypeRepositoryImpl implements ConversationMessageTypeRepository {
  final ConversationMessageTypeLocalDataSource localDataSource;

  ConversationMessageTypeRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<ConversationMessageTypeEntity>>> getAllMessageTypes() async {
    try {
      final messageTypes = await localDataSource.getAllMessageTypes();
      return Right(messageTypes);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<ConversationMessageTypeEntity>>> getMessageTypesByConversationId(String conversationId) async {
    try {
      final messageTypes = await localDataSource.getMessageTypesByConversationId(conversationId);
      return Right(messageTypes);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, ConversationMessageTypeEntity>> getMessageTypeById(int id) async {
    try {
      final messageType = await localDataSource.getMessageTypeById(id);
      return Right(messageType);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addMessageType(ConversationMessageTypeEntity messageType) async {
    try {
      await localDataSource.addMessageType(messageType);
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateMessageType(ConversationMessageTypeEntity messageType) async {
    try {
      await localDataSource.updateMessageType(messageType);
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteMessageType(int id) async {
    try {
      await localDataSource.deleteMessageType(id);
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
