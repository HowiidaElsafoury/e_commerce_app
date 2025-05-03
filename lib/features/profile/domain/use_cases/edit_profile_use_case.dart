import 'package:e_commerce_app/features/profile/domain/entity/profile_user_entity.dart';
import 'package:e_commerce_app/features/profile/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';

@injectable
class EditProfileUseCase {
  final ProfileRepo _profileRepo;

  EditProfileUseCase(this._profileRepo);
  Future<Result<ProfileUserEntity?>> editProfile() async {
    return _profileRepo.editProfile();
  }
}
