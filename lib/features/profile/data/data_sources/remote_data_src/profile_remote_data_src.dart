import 'package:e_commerce_app/core/networking/api_call.dart';
import 'package:e_commerce_app/core/networking/dio/dio_helper.dart';
import 'package:e_commerce_app/features/profile/data/model/profile_user_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/api_result.dart';

@injectable
class ProfileRemoteDataSrc {
  late final DioHelper _dioHelper;
  ProfileRemoteDataSrc() {
    _dioHelper = DioHelper.getInstance();
  }
  Future<Result<ProfileUserModel?>> getLoggedUserData() async {
    final result = await makeApiCall(() {
      return _dioHelper.getData("/auth/profile-data", tokenReq: true);
    });
    switch (result) {
      case Success():
        final response = result.data!.data;

        final responseData = ProfileUserModel.fromJson(response);
        return Success(data: responseData);

      case Error():
        return Error(exception: result.exception);
    }
  }
}
