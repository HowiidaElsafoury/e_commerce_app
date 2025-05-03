import 'package:e_commerce_app/features/profile/data/model/user_model.dart';
import 'package:e_commerce_app/features/profile/domain/entity/profile_user_entity.dart';

class ProfileUserModel {
  final String? message;
  final ProfileUser user;

  ProfileUserModel({
    this.message,
    required this.user,
  });

  ProfileUserEntity toEntity() {
    return ProfileUserEntity(message: message, userEntity: user.toEntity());
  }

  factory ProfileUserModel.fromJson(Map<String, dynamic> json) =>
      ProfileUserModel(
        message: json["message"],
        user: ProfileUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
      };
}
