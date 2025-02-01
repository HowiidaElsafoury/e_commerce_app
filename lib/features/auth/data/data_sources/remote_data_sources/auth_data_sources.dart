import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/dio/dio_factory.dart';
import '../../models/requests/register_request_body.dart';
import '../../models/user_model.dart';
import '../../models/user_tokens.dart';

@injectable
class AuthDataSources {
  late final Dio dio;

  AuthDataSources() {
    dio = DioFactory.getDio();
  }

  Future<UserTokens> login(
      {required String email, required String password}) async {
    final param = {"email": email, "password": password};
    try {
      final response = await dio.post("/auth/signin", data: param);
      if (response.statusCode == 200 && response.data != null) {
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
      if (response.statusCode == 200 && response.data != null) {
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
