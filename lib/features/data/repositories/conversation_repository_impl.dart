import 'package:dartz/dartz.dart';
import 'package:my_app/core/error/exceptions.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:my_app/features/conversations/data/datasources/conversation_local_data_source.dart';
import 'package:my_app/features/conversations/domain/entities/conversation_entity.dart';
import 'package:my_app/features/conversations/domain/repositories/conversation_repository.dart';

class ConversationRepositoryImpl implements ConversationRepository {
  final ConversationLocalDataSource localDataSource;

  ConversationRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<ConversationEntity>>> getAllConversations() async {
    try {
      final conversations = await localDataSource.getAllConversations();
      return Right(conversations);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, ConversationEntity>> getConversationById(int id) async {
    try {
      final conversation = await localDataSource.getConversationById(id);
      return Right(conversation);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addConversation(ConversationEntity conversation) async {
    try {
      await localDataSource.addConversation(conversation);
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateConversation(ConversationEntity conversation) async {
    try {
      await localDataSource.updateConversation(conversation);
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteConversation(int id) async {
    try {
      await localDataSource.deleteConversation(id);
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
