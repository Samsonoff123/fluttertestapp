import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesCubit extends Cubit<List<String>> {
  MessagesCubit() : super([]);

  void addMessage(String message) {
    final updatedMessages = List<String>.from(state)..add(message);
    emit(updatedMessages);
  }
}
