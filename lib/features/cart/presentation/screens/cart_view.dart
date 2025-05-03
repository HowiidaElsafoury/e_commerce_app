import 'package:e_commerce_app/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/cart/presentation/screens/cart_app_bar.dart';
import 'package:e_commerce_app/features/cart/presentation/screens/widgets/cart_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'widgets/delete_cart_product_listener.dart';
import 'widgets/update_cart_product.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CartAppBar(),
      body: Column(
        children: [
          const DeleteCartDataListener(),
          const UpdateCartProductListener(),
          BlocBuilder<CartCubit, CartState>(
            buildWhen: (previous, current) {
              if (current is CartLoading ||
                  current is CartFailure ||
                  current is CartEmpty ||
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
                    cartItems: state.cartResponseEntity?.cart.cartItems ?? []);
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
