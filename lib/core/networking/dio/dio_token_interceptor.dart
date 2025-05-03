import 'package:dio/dio.dart';
import 'package:e_commerce_app/features/auth/presentation/auth/pages/login_view.dart';
import 'package:flutter/foundation.dart';

import '../../../main.dart';
import '../../utilis/token_manager.dart';

class TokenInterceptor extends Interceptor {
  bool _isLoggingOut = false;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String token = await TokensManager.getToken();

    if (token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    } else {
      options.headers["Authorization"] = "";
    }
    debugPrint("Access Token: $token");

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // if (response.statusCode == 401) {
    //   debugPrint("=====================================");
    //   debugPrint("Token expired");

    //   await logout();
    // }
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      await logout();
    }
    super.onError(err, handler);
  }

  Future<void> logout() async {
    if (_isLoggingOut) return;

    _isLoggingOut = true;

    await TokensManager.deleteToken();

    navKey.currentState?.pushNamedAndRemoveUntil(
      LoginView.routeName,
      (route) => false,
    );
  }
}
