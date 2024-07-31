import 'package:dartz/dartz.dart';
import 'package:my_app/core/error/exceptions.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:my_app/features/messages/data/datasources/message_local_data_source.dart';
import 'package:my_app/features/messages/domain/entities/message_entity.dart';
import 'package:my_app/features/messages/domain/repositories/message_repository.dart';

class MessageRepositoryImpl implements MessageRepository {
  final MessageLocalDataSource localDataSource;

  MessageRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<MessageEntity>>> getAllMessages() async {
    try {
      final messages = await localDataSource.getAllMessages();
      return Right(messages);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<MessageEntity>>> getMessagesBySenderPhoneNumber(String senderPhoneNumber) async {
    try {
      final messages = await localDataSource.getMessagesBySenderPhoneNumber(senderPhoneNumber);
      return Right(messages);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<MessageEntity>>> getMessagesByTargetPhoneNumber(String targetPhoneNumber) async {
    try {
      final messages = await localDataSource.getMessagesByTargetPhoneNumber(targetPhoneNumber);
      return Right(messages);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> getMessageById(int id) async {
    try {
      final message = await localDataSource.getMessageById(id);
      return Right(message);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addMessage(MessageEntity message) async {
    try {
      await localDataSource.addMessage(message);
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateMessage(MessageEntity message) async {
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
