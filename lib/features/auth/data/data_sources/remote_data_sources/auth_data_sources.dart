import 'package:e_commerce_app/features/auth/data/models/requests/register_request_body.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/data/models/user_tokens.dart';
import 'package:dio/dio.dart';

class AuthDataSources {
  final Dio dio;

  AuthDataSources(this.dio);

  Future<UserTokens> login(
      {required String email, required String password}) async {
    final param = {"email": email, "password": password};
    try {
      final response = await dio.post("/auth/signin", data: param);
      if (response.statusCode == 201 && response.data != null) {
        final tokens = UserTokens.fromJson(response.data);
        return tokens;
      } else {
        throw (Exception("FAILED TO LOGIN"));
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(
      final RegisterRequestBody registerRequestBody) async {
    final param = registerRequestBody.toJson();
    try {
      final response = await dio.post("/auth/signup", data: param);
      if (response.statusCode == 201 && response.data != null) {
        final userData = UserModel.fromJson(response.data);
        return userData;
      } else {
        throw (Exception("FAILED TO Sign Up"));
      }
    } catch (e) {
      rethrow;
    }
  }
}
