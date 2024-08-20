import 'package:signalr_core/signalr_core.dart';
import 'package:my_app/features/presentation/blocs/auth_cubit.dart';
import 'package:flutter/foundation.dart';

class SignalRService {
  late HubConnection _connection;
  Function(String)? onNewMessage;

  Future<void> connectToSignalR(AuthCubit authCubit) async {
    try {
      final token = await authCubit.getToken();

      print('token $token');

      final baseUrl = defaultTargetPlatform == TargetPlatform.windows 
        ? 'http://localhost' 
        : 'http://10.0.2.2';

      _connection = HubConnectionBuilder()
          .withUrl(
            '$baseUrl/hub/messenger',
            HttpConnectionOptions(
              accessTokenFactory: () => Future.value(token),
            ),
          )
          .withAutomaticReconnect()
          .build();

      _connection.on('ReceiveMessage', _handleIncomingMessage);

      await _connection.start();
      print('Connected to SignalR server');
    } catch (e) {
      print('Error connecting to SignalR: $e');
    }
  }

  void _handleIncomingMessage(List<Object?>? parameters) {
    if (parameters != null) {
      final user = parameters[0] as String;
      final messageContent = parameters[1] as String;
      final message = '$user: $messageContent';

      if (onNewMessage != null) {
        onNewMessage!(message);
      }
    }
  }

  final userName = defaultTargetPlatform == TargetPlatform.windows 
    ? 'windowsUser' 
    : 'androidUser';

  Future<void> sendMessage(String message) async {
    try {
      await _connection.invoke('SendMessage', args: [userName, message]);
      print('Message sent: $message');
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  void dispose() {
    if (_connection.state == HubConnectionState.connected) {
      _connection.off('ReceiveMessage');
      _connection.stop();
    }
  }
}
