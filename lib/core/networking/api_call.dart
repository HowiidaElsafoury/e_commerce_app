import 'package:e_commerce_app/core/networking/api_result.dart';

Future<Result<T>> makeApiCall<T>(Future<T> Function() function) async {
  try {
    return Success(data: await function());
  } catch (e) {
    return Error(exception: e as Exception);
  }
}
