import '../../../../core/networking/api_result.dart';
import '../entity/profile_user_entity.dart';

abstract class ProfileRepo {
  Future<Result<ProfileUserEntity?>> getLoggedUserData();
  Future<Result<ProfileUserEntity?>> editProfile();
}
