import 'package:e_commerce_app/features/profile/domain/entity/profile_user_entity.dart';
import 'package:e_commerce_app/features/profile/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';

@injectable
class GetLoggedUserDataUseCase {
  final ProfileRepo _profileRepo;

  GetLoggedUserDataUseCase(this._profileRepo);

  Future<Result<ProfileUserEntity?>> getLoggedUserData() async {
    return await _profileRepo.getLoggedUserData();
  }
}
