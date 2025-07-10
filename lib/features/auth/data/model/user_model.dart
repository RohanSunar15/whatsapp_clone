import 'package:whatsapp_clone/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.mongoId,
    required super.uid,
    required super.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      mongoId: json['mongoId'],
      uid: json['uid'],
      phoneNumber: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'mongoId': mongoId, 'uid': uid, 'phone': phoneNumber};
  }

  @override
  String toString() {
    return 'UserModel(mongoId: $mongoId, uid: $uid, phoneNumber: $phoneNumber)';
  }
}
