import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/features/domain/usecases/user_usecases/get_user_by_id_usecase.dart';
import 'package:my_app/features/domain/entities/user_entity.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserByIdUseCase getUserByIdUseCase;

  UserBloc({required this.getUserByIdUseCase}) : super(UserInitial()) {
    on<GetUserByIdEvent>(_onGetUserById);
  }

  void _onGetUserById(GetUserByIdEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    final failureOrUser = await getUserByIdUseCase(event.id);
    emit(_eitherLoadedOrErrorState(failureOrUser));
  }

  UserState _eitherLoadedOrErrorState(Either<Failure, UserEntity> failureOrUser) {
    return failureOrUser.fold(
      (failure) => UserError(message: _mapFailureToMessage(failure)),
      (user) => UserLoaded(user: user),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
