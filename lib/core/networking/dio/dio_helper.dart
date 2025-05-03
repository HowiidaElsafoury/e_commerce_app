import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../app_constants/app_constants.dart';
import 'dio_factory.dart';

class DioHelper {
  static Dio? _freeDio;
  static Dio? _tokenDio;
  static DioHelper? _instance;

  DioHelper._();

  static getInstance() {
    if (_instance == null) {
      _instance = DioHelper._();
      _freeDio = DioFactory.getFreeDio();
      _tokenDio = DioFactory.getTokenDio();

      return _instance;
    } else {
      return _instance;
    }
  }

  Future<Response> getData(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    bool tokenReq = false,
  }) async {
    try {
      final dio = tokenReq ? _tokenDio : _freeDio;
      // final dio = _freeDio;
      // Map<String, dynamic> headers = {};
      // if (tokenReq) {
      //   const storage = FlutterSecureStorage();

      //   final String token =
      //       await storage.read(key: AppConstants.tokenSPK) ?? "";
      //   headers = {"Authorization": "Bearer $token"};
      // }

      final response = await dio!.get(
        path,
        data: body,
        queryParameters: query,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postData(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, dynamic>? localData,
    Map<String, String>? headers, // Optional header parameter
    bool tokenReq = false,
  }) async {
    try {
      final dio = tokenReq ? _tokenDio : _freeDio;
      // final dio = _freeDio;
      // Map<String, dynamic> headers = {};
      // if (tokenReq) {
      //   const storage = FlutterSecureStorage();

      //   final String token =
      //       await storage.read(key: AppConstants.tokenSPK) ?? "";
      //   headers = {"Authorization": "Bearer $token"};
      // }
      final response = await dio!.post(
        path,
        data: body,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> putData(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, dynamic>? localData,
    Map<String, String>? headers, // Optional header parameter
    bool tokenReq = false,
  }) async {
    try {
      final dio = _freeDio;
      Map<String, dynamic> headers = {};
      if (tokenReq) {
        const storage = FlutterSecureStorage();

        final String token =
            await storage.read(key: AppConstants.tokenSPK) ?? "";
        headers = {"Authorization": "Bearer $token"};
      }
      final response = await dio!.put(
        path,
        data: body,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String endPoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    bool tokenReq = false,
  }) async {
    try {
      final dio = _freeDio;
      Map<String, dynamic> headers = {};
      if (tokenReq) {
        const storage = FlutterSecureStorage();

        final String token =
            await storage.read(key: AppConstants.tokenSPK) ?? "";
        headers = {"Authorization": "Bearer $token"};
      }

      final response = await dio!.delete(endPoint,
          data: body,
          queryParameters: query,
          options: Options(headers: headers));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future deleteData(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, dynamic>? localData,
    String? localWhereClause,
    List<String>? localWhereArgs,
    bool tokenReq = false,
  }) async {
    try {
      final dio = tokenReq ? _tokenDio : _freeDio;

      final response = await dio!.delete(
        path,
        data: body,
        queryParameters: query,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
