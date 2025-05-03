import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/dio/dio_token_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app_constants/app_constants.dart';

class DioFactory {
  DioFactory._();
  static Dio? _freeDio;
  static Dio? _tokenDio;
  static Dio? _dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);
    if (_dio == null) {
      _dio = Dio();
      _dio!.options
        ..baseUrl = AppConstants.baseUrl
        ..connectTimeout = timeOut
        ..receiveTimeout = timeOut
        ..validateStatus = (status) => status! < 500;
      _addFreeDioInterceptors(_dio!);
    }

    return _dio!;
  }

  static Dio getFreeDio() {
    Duration timeOut = const Duration(seconds: 60);

    if (_freeDio == null) {
      _freeDio = Dio();
      _freeDio!.options
        ..baseUrl = AppConstants.baseUrl
        ..connectTimeout = timeOut
        ..receiveTimeout = timeOut
        ..validateStatus =
            (status) => status != null ? status == 200 || status == 201 : false;
      _addFreeDioInterceptors(_freeDio!);
      return _freeDio!;
    } else {
      return _freeDio!;
    }
  }

  static Dio getTokenDio() {
    Duration timeOut = const Duration(seconds: 60);

    if (_tokenDio == null) {
      // TODO: Change to production url
      _tokenDio = Dio();
      _tokenDio!.options
        ..baseUrl = AppConstants.baseUrl
        ..connectTimeout = timeOut
        ..receiveTimeout = timeOut
        ..validateStatus =
            (status) => status != null ? status == 200 || status == 201 : false;
      _addTokenDioInterceptors();
      return _tokenDio!;
    } else {
      return _tokenDio!;
    }
  }

  static void _addFreeDioInterceptors(Dio dio) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        enabled: !kReleaseMode,
      ),
    );
  }

  static void _addTokenDioInterceptors() {
    _tokenDio!.interceptors.addAll(
      [
        TokenInterceptor(),
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          enabled: !kReleaseMode,
        ),
      ],
    );
  }
}
