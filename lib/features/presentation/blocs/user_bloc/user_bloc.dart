import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/domain/usecases/user_usecases/get_user_by_id_usecase.dart';
import 'package:my_app/features/presentation/blocs/user_bloc/user_event.dart';
import 'package:my_app/features/presentation/blocs/user_bloc/user_state.dart';
import 'package:my_app/features/data/models/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserByIdUseCase getUserByIdUseCase;

  UserBloc({required this.getUserByIdUseCase}) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is GetUserByIdEvent) {
      yield UserLoading();
      final failureOrUserEntity = await getUserByIdUseCase(event.id);
      yield failureOrUserEntity.fold(
        (failure) => UserError(message: 'Error getting user'),
        (userEntity) {
          final userModel = UserModel.fromEntity(userEntity);
          return UserLoaded(user: userModel);
        },
      );
    }
  }
}
