import 'package:e_commerce_app/core/app_constants/app_constants.dart';
import 'package:e_commerce_app/features/auth/data/data_sources/remote_data_sources/auth_data_sources.dart';
import 'package:e_commerce_app/features/auth/data/models/requests/register_request_body.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepo {
  final AuthDataSources authDataSources;

  AuthRepo(this.authDataSources);

  Future<void> login({required String email, required String password}) async {
    try {
      final token =
          await authDataSources.login(email: email, password: password);

      final storage = FlutterSecureStorage();

      await storage.write(key: AppConstants.tokenSPK, value: token.token);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register(final RegisterRequestBody registerRequestBody) async {
    try {
      final userModel = await authDataSources.register(registerRequestBody);

      final storage = FlutterSecureStorage();
      await storage.write(key: AppConstants.tokenSPK, value: userModel.token);
    } catch (e) {
      rethrow;
    }
  }
}
