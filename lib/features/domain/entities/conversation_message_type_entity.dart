

import 'package:equatable/equatable.dart';

@Entity()
class ConversationMessageTypeEntity extends Equatable {
  const ConversationMessageTypeEntity({
    this.id,
    this.conversationId,
    this.messageId,
    this.receiverPhoneNumber,
    this.messageType,
  });

  @Id(assignable: true)
  final int? id;
  final String? conversationId;
  final String? messageId;
  final String? receiverPhoneNumber;
  final String? messageType;

  @override
  List<Object?> get props => [
    id,
    groupId,
    messageId,
    receiverPhoneNumber,
    messageType,
  ];

}
