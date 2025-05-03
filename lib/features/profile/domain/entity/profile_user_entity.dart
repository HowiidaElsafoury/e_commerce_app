import 'package:e_commerce_app/features/profile/domain/entity/user_entity.dart';

class ProfileUserEntity {
  final String? message;
  final UserEntity userEntity;

  ProfileUserEntity({this.message, required this.userEntity});
}
