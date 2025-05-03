import 'package:e_commerce_app/core/networking/api_call.dart';
import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/core/networking/dio/dio_helper.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_response_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartRemoteDataSrc {
  late final DioHelper _dioHelper;
  CartRemoteDataSrc() {
    _dioHelper = DioHelper.getInstance();
  }

  Future<Result<CartResponseModel>> getCartData() async {
    final result = await makeApiCall(() {
      return _dioHelper.getData("/cart", tokenReq: true);
    });

    switch (result) {
      case Success():
        final response = result.data!.data;
        final responseData = CartResponseModel.fromJson(response);

        return Success<CartResponseModel>(data: responseData);
      case Error():
        return Error<CartResponseModel>(exception: result.exception);
    }
    //  makeApiCall((){

    //    final response = await _dioHelper.getData(
    //       "/cart",
    //     );
    //     if (response.data != null) {
    //       final data = CartResponseModel.fromJson(response.data);
    //       return  data;
    //     } else {
    //       return Error( exception: Exception(response.data["error"]));
    //     }

    //  })
  }

  Future<Result<CartResponseModel>> addCartData(
      String product, int quantity) async {
    final result = await makeApiCall(() {
      final body = {"product": product, "quantity": quantity};
      return _dioHelper.postData("/cart", body: body);
    });
    switch (result) {
      case Success():
        final response = result.data!.data;
        final responseData = CartResponseModel.fromJson(response);

        return Success<CartResponseModel>(data: responseData);
      case Error():
        return Error<CartResponseModel>(exception: result.exception);
    }
  }
  //  final body = {"product": product, "quantity": quantity};

  //     final response = await _dioHelper.postData("/cart",
  //     body: body
  //       );
  //     if ( response.data != null) {
  //       final data = CartResponseModel.fromJson(response.data);
  //       return Success(data: data);
  //     } else {
  //       return Error(exception: Exception(response.data["error"]),);
  //     }

  Future<Result<CartResponseModel>> updateCartQuantity(
      String productId, int quantity) async {
    final result = await makeApiCall(() {
      final body = {"quantity": quantity};
      return _dioHelper.putData("/cart/$productId", body: body, tokenReq: true);
    });
    switch (result) {
      case Success():
        final response = result.data!.data;
        final responseData = CartResponseModel.fromJson(response);
        return Success<CartResponseModel>(data: responseData);

      case Error():
        return Error(exception: result.exception);
    }
  }
  // final body = {"quantity": quantity};

  //     final response = await _dioHelper.putData("/cart/$productId", body: body);
  //     if (response.data != null) {
  //       final data = CartResponseModel.fromJson(response.data);
  //       return Right(data);
  //     } else {
  //       return Left(response.data["error"]);
  //     }

  Future<Result<CartResponseModel>> deleteCartData(String productId) async {
    final result = await makeApiCall(() {
      return _dioHelper.delete("/cart/$productId", tokenReq: true);
    });

    switch (result) {
      case Success():
        final response = result.data!.data;
        final responseData = CartResponseModel.fromJson(response);

        return Success<CartResponseModel>(data: responseData);

      case Error():
        return Error(exception: result.exception);
    }
  }
}
