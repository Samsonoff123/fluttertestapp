import 'package:signalr_core/signalr_core.dart';
import 'package:flutter/foundation.dart';

class SignalRService {
  late HubConnection _connection;
  Function(String)? onNewMessage;

  Future<void> connectToSignalR() async {
    String token = "eyJhbGciOiJSUzI1NiIsImtpZCI6IkM2M0UyMzFFMzE3MDJGMDI4NjE2QTMwNjlBQkI4OTcwMDIyOUQ2QjZSUzI1NiIsInR5cCI6ImF0K2p3dCIsIng1dCI6InhqNGpIakZ3THdLR0ZxTUdtcnVKY0FJcDFyWSJ9.eyJuYmYiOjE3MjMwMTUzNDEsImV4cCI6MTcyMzAxODk0MSwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdCIsImF1ZCI6Im1lc3NlbmdlciIsImNsaWVudF9pZCI6ImI0OWE0ZTYzLTkyMzMtNGZhZC1hNGVmLTZiMjM1M2ZkYjYyYSIsInN1YiI6IjhjMzRlOTkwLTMyZGMtNGRkMS04NmYyLTA4ZGNiNWY2MjI3ZCIsImF1dGhfdGltZSI6MTcyMzAxNTM0MSwiaWRwIjoibG9jYWwiLCJqdGkiOiI5MzY1QTBDNUY1RThCMzZCRDExMTU5MkY1QTMxMTczNSIsImlhdCI6MTcyMzAxNTM0MSwic2NvcGUiOlsibWVzc2VuZ2VyLmFwaSIsIm9wZW5pZCIsInByb2ZpbGUiLCJvZmZsaW5lX2FjY2VzcyJdLCJhbXIiOlsicHdkIl19.BDqtpZbWWG4UYld2b0w9Tq1w6Fah73YbX36Q52moPLdcYBxffHyOjxxw8MvFG2es2oz-NxIAiR5dk9LK1l7vLizJQbr-o8UaroHxUH3PfdgsOFz0RpCazoMYcpnTzhYw8KdVk7OXGFFJIE_WX59Ib2Nk8eufBtClM3fQCodr5WWP22RQUAjsd6zWD0DeCHG4NoHpnHTGvK355LxfDih0bdA19ZHUB1d_Zbon_TVRVoyZIkYt6FcDDxkX1-A9QxNmLuYz0M4ojFadAtkYpuYOosTN0ll4vsocgLbDimAuTsCUqMSxykyLmO6CPkh5KgZ7AEtHXVjPGPz-odZL-_Zj_A";
    try {
      final baseUrl = defaultTargetPlatform == TargetPlatform.windows 
        ? 'http://localhost/hub/messenger' 
        : 'http://10.0.2.2/hub/messenger';

      _connection = HubConnectionBuilder()
          .withUrl(baseUrl,
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
    print('parameters: $parameters');
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
