import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:my_app/features/data/repositories/user_repository_impl.dart';
import 'package:my_app/features/data/datasources/user_local_data_source.dart';
import 'package:my_app/features/domain/usecases/user_usecases/get_user_by_id_usecase.dart';
import 'package:my_app/features/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:my_app/features/domain/repositories/user_repository.dart';
import 'dart:io';

final sl = GetIt.instance;

Future<void> initLocator() async {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  final database = await openDatabase(
    join(await getDatabasesPath(), 'user_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE users(id INTEGER PRIMARY KEY, userPhoneNumber TEXT, fullName TEXT, userAvatar TEXT, lastSeenDateTime TEXT, lastMessageBody TEXT, lastMessageDateTime TEXT, lastMessageCategory TEXT, lastMessageType TEXT, lastMessageIsReadByTargetUser INTEGER, isConfirm INTEGER, notReadMessageCount INTEGER, verifyCode TEXT, verifyProfile INTEGER)',
      );
    },
    version: 1,
  );

  sl.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSourceImpl(db: database));

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl<UserLocalDataSource>()));

  sl.registerLazySingleton(() => GetUserByIdUseCase(sl<UserRepository>()));

  sl.registerFactory<UserBloc>(() => UserBloc(getUserByIdUseCase: sl<GetUserByIdUseCase>()));
}
