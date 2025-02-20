import 'package:e_commerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/cart/presentation/screens/cart_app_bar.dart';
import 'package:e_commerce_app/features/cart/presentation/screens/widgets/cart_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CartAppBar(),
      body: Column(
        children: [
          BlocBuilder<CartCubit, CartState>(
            buildWhen: (previous, current) {
              if (current is CartLoading ||
                  current is CartFailure ||
                  current is CartSuccess) {
                return true;
              } else {
                return false;
              }
            },
            builder: (context, state) {
              if (state is CartLoading) {
                return const CircularProgressIndicator();
              } else if (state is CartFailure) {
                return Text(state.message);
              } else if (state is CartSuccess) {
                return CartProductList(
                    cartItems: state.cartResponseEntity.cart.cartItems);
              } else if (state is CartEmpty) {
                return SizedBox(
                  height: 0.7.sh,
                  child: Center(
                      child: Lottie.asset("assets/animations/empty_cart.json")),
                );
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
