import 'package:get_it/get_it.dart';
import 'package:my_app/features/data/repositories/user_repository_impl.dart';
import 'package:my_app/features/data/datasources/user_local_data_source.dart';
import 'package:my_app/features/domain/usecases/user_usecases/get_user_by_id_usecase.dart';
import 'package:my_app/features/presentation/blocs/user_bloc/user_bloc.dart';

final sl = GetIt.instance;

Future<void> initLocator() async {
  // Регистрация источников данных
  sl.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSourceImpl(store: sl()));

  // Регистрация репозиториев
  sl.registerLazySingleton<UserRepository>(() {
    print('Registering UserRepository');
    return UserRepositoryImpl(sl());
  });

  // Регистрация use cases
  sl.registerLazySingleton(() => GetUserByIdUseCase(sl()));

  // Регистрация Bloc/Cubit
  sl.registerFactory(() {
    print('Creating UserBloc');
    return UserBloc(getUserByIdUseCase: sl());
  });
}

