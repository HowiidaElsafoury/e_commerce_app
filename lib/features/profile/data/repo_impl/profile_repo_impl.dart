import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/features/profile/data/data_sources/remote_data_src/profile_remote_data_src.dart';
import 'package:e_commerce_app/features/profile/domain/entity/profile_user_entity.dart';
import 'package:e_commerce_app/features/profile/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSrc _profileRemoteDataSrc;

  ProfileRepoImpl(this._profileRemoteDataSrc);
  @override
  Future<Result<ProfileUserEntity?>> getLoggedUserData() async {
    final response = await _profileRemoteDataSrc.getLoggedUserData();
    switch (response) {
      case Success():
        return Success(data: response.data?.toEntity());

      case Error():
        return Error(exception: response.exception);
    }
  }

  @override
  Future<Result<ProfileUserEntity?>> editProfile() {
    // TODO: implement getLoggedUserData
    throw UnimplementedError();
  }
}
