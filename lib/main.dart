import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/injection_container.dart';
import 'package:my_app/features/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:my_app/features/data/models/user_model.dart';
import 'package:my_app/features/data/datasources/user_local_data_source.dart';
import 'package:my_app/features/presentation/screens/privat_wrapper_screen.dart';
import 'package:my_app/services/signalr_service.dart';
import 'package:my_app/features/presentation/blocs/messages_cubit.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('Initializing dependencies...');
  await initLocator();

  final userName = defaultTargetPlatform == TargetPlatform.windows 
  ? 'windowsUser' 
  : 'androidUser';

  final userLocalDataSource = sl<UserLocalDataSource>();
  await userLocalDataSource.addUser(UserModel(
    id: 1,
    userPhoneNumber: '123456789',
    fullName: userName,
    userAvatar: 'path/to/avatar',
    lastSeenDateTime: '2023-07-01T12:34:56',
    lastMessageBody: 'Hello',
    lastMessageDateTime: '2023-07-01T12:34:56',
    lastMessageCategory: 'Text',
    lastMessageType: 'Sent',
    lastMessageIsReadByTargetUser: true,
    isConfirm: true,
    notReadMessageCount: 0,
    verifyCode: '1234',
    verifyProfile: true,
  ));
  print('Dependencies initialized');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<UserBloc>()..add(const GetUserByIdEvent(id: 1))),
        BlocProvider(create: (context) => MessagesCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: PrivatWrapperScreen(),
      ),
    );
  }
}
