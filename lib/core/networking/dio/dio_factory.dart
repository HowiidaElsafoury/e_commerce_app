import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app_constants/app_constants.dart';

class DioFactory {
  static Dio? _dio;
  static getDio() {
    Duration timeOut = Duration(seconds: 30);
    if (_dio == null) {
      _dio = Dio();
      _dio!.options
        ..baseUrl = AppConstants.baseUrl
        ..connectTimeout = timeOut
        ..receiveTimeout = timeOut
        ..validateStatus = (status) => status! < 500;
      _addFreeDioInterceptors(_dio!);
    }

    return _dio;
  }

  static void _addFreeDioInterceptors(Dio dio) {
    dio.interceptors.addAll(
      [
        !kReleaseMode
            ? PrettyDioLogger(
                requestBody: true,
                requestHeader: true,
                responseHeader: true,
                responseBody: true,
              )
            : const Interceptor(),
      ],
    );
  }
}
