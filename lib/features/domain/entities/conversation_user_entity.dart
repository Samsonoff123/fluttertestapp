

import 'package:equatable/equatable.dart';

@Entity()
class ConversationUserEntity extends Equatable {
  const ConversationUserEntity({
    this.id,
    this.groupId,
    this.userPhoneNumber,
    this.isAdmin,
  });

  @Id(assignable: true)
  final int? id;
  final String? groupId;
  final String? userPhoneNumber;
  final bool? isAdmin;

  @override
  List<Object?> get props => [
    id,
    groupId,
    userPhoneNumber,
    isAdmin,
  ];

}
