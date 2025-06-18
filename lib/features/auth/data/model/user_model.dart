import 'package:whatsapp_clone/features/auth/domain/entities/user.entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uid,
    required super.phoneNumber,
    super.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      phoneNumber: json['phone'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'phone': phoneNumber,
      'name': name,
    };
  }
}