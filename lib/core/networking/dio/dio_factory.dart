import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/app_constants/app_constants.dart';

class DioFactory {
  static late Dio? _dio;
  static getDio() {
    Duration timeOut = Duration(seconds: 30);
    if (_dio == null) {
      _dio = Dio();
      _dio!.options
        ..baseUrl = AppConstants.baseUrl
        ..connectTimeout = timeOut
        ..receiveTimeout = timeOut;
    }
    return _dio;
  }
}
