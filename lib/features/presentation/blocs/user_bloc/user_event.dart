import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUserByIdEvent extends UserEvent {
  final int id;

  GetUserByIdEvent(this.id);

  @override
  List<Object?> get props => [id];
}
