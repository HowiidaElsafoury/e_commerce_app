import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/auth/data/models/responses/user_model.dart';
import 'package:e_commerce_app/features/auth/data/models/responses/user_tokens.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/app_constants/app_constants.dart';
import '../data_sources/remote_data_sources/auth_data_sources.dart';
import '../models/requests/register_request_body.dart';

@injectable
class AuthRepo {
  final AuthDataSources authDataSources;

  AuthRepo(this.authDataSources);

  Future<Either<String, UserTokens>> login(
      {required String email, required String password}) async {
    final response =
        await authDataSources.login(email: email, password: password);
    return response.fold((error) {
      return Left(error);
    }, (result) async {
      const storage = FlutterSecureStorage();

      await storage.write(key: AppConstants.tokenSPK, value: result.token);
      return Right(result);
    });
  }

  Future<Either<String, UserModel>> register(
      final RegisterRequestBody registerRequestBody) async {
    final userModel = await authDataSources.register(registerRequestBody);
    return userModel.fold((error) {
      return Left(error);
    }, (result) async {
      const storage = FlutterSecureStorage();
      await storage.write(key: AppConstants.tokenSPK, value: result.token);
      return Right(result);
    });
  }
}
