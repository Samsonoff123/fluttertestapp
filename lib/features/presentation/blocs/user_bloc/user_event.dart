import 'package:equatable/equatable.dart';
part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserByIdEvent extends UserEvent {
  final int id;

  const GetUserByIdEvent({required this.id});

  @override
  List<Object> get props => [id];
}
