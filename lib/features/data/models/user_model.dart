import 'package:objectbox/objectbox.dart';
import 'package:my_app/features/domain/entities/user_entity.dart';

@Entity()
class UserModel {
  @Id(assignable: true)
  final int? id;
  final String? userPhoneNumber;
  final String? fullName;
  final String? userAvatar;
  final String? lastSeenDateTime;
  final String? lastMessageBody;
  final String? lastMessageDateTime;
  final String? lastMessageCategory;
  final String? lastMessageType;
  final bool? lastMessageIsReadByTargetUser;
  final bool? isConfirm;
  final int? notReadMessageCount;
  final String? verifyCode;
  final bool? verifyProfile;

  UserModel({
    this.id,
    this.userPhoneNumber,
    this.fullName,
    this.userAvatar,
    this.lastSeenDateTime,
    this.lastMessageBody,
    this.lastMessageDateTime,
    this.lastMessageCategory,
    this.lastMessageType,
    this.lastMessageIsReadByTargetUser,
    this.isConfirm,
    this.notReadMessageCount,
    this.verifyCode,
    this.verifyProfile,
  });

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      userPhoneNumber: userPhoneNumber,
      fullName: fullName,
      userAvatar: userAvatar,
      lastSeenDateTime: lastSeenDateTime,
      lastMessageBody: lastMessageBody,
      lastMessageDateTime: lastMessageDateTime,
      lastMessageCategory: lastMessageCategory,
      lastMessageType: lastMessageType,
      lastMessageIsReadByTargetUser: lastMessageIsReadByTargetUser,
      isConfirm: isConfirm,
      notReadMessageCount: notReadMessageCount,
      verifyCode: verifyCode,
      verifyProfile: verifyProfile,
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      userPhoneNumber: entity.userPhoneNumber,
      fullName: entity.fullName,
      userAvatar: entity.userAvatar,
      lastSeenDateTime: entity.lastSeenDateTime,
      lastMessageBody: entity.lastMessageBody,
      lastMessageDateTime: entity.lastMessageDateTime,
      lastMessageCategory: entity.lastMessageCategory,
      lastMessageType: entity.lastMessageType,
      lastMessageIsReadByTargetUser: entity.lastMessageIsReadByTargetUser,
      isConfirm: entity.isConfirm,
      notReadMessageCount: entity.notReadMessageCount,
      verifyCode: entity.verifyCode,
      verifyProfile: entity.verifyProfile,
    );
  }
}
