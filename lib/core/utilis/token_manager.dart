import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../app_constants/app_constants.dart';

class TokensManager {
  static Future<String> getToken() async {
    const storage = FlutterSecureStorage();

    return await storage.read(key: AppConstants.tokenSPK) ?? "";
  }

  static Future<void> deleteToken() async {
    const storage = FlutterSecureStorage();

    await storage.delete(key: AppConstants.tokenSPK);
  }
}
