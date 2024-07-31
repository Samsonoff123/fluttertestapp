

import 'package:equatable/equatable.dart';

@Entity()
class ConversationEntity extends Equatable {
  const ConversationEntity({
    this.id,
    this.message,
    this.name,
    this.avatar,
    this.createDateTime,
    this.lastMessageSenderFullName,
    this.lastMessageBody,
    this.lastMessageDateTime,
    this.lastMessageCategory,
    this.lastMessageType,
    this.lastMessageIsReadByGroupUser,
    this.isConfirm,
    this.notReadMessageCount,
  });

  @Id(assignable: true)
  final int? id;
  final String? message;
  final String? name;
  final String? avatar;
  final String? createDateTime;
  final String? lastMessageSenderFullName;
  final String? lastMessageBody;
  final String? lastMessageDateTime;
  final String? lastMessageCategory;
  final String? lastMessageType;
  final bool? lastMessageIsReadByGroupUser;
  final bool? isConfirm;
  final int? notReadMessageCount;

  @override
  List<Object?> get props => [
    id,
    message,
    name,
    avatar,
    createDateTime,
    lastMessageSenderFullName,
    lastMessageBody,
    lastMessageDateTime,
    lastMessageCategory,
    lastMessageType,
    lastMessageIsReadByGroupUser,
    isConfirm,
    notReadMessageCount,
  ];

}
