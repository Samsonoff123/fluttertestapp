


import 'package:equatable/equatable.dart';

@Entity()
class ConversationMessageEntity extends Equatable {
  const ConversationMessageEntity({
    this.id,
    this.messageId,
    this.conversationId,
    this.senderPhoneNumber,
    this.messageCategory,
    this.messageBody,
    this.messageDateTime,
  });

  @Id(assignable: true)
  final int? id;
  final String? messageId;
  final String? conversationId;
  final String? senderPhoneNumber;
  final String? messageCategory;
  final String? messageBody;
  final String? messageDateTime;

  @override
  List<Object?> get props => [
    id,
    conversationId,
    groupId,
    senderPhoneNumber,
    messageCategory,
    messageBody,
    messageDateTime,
  ];

}
