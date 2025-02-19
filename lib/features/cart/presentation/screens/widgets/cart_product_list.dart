import 'package:e_commerce_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:e_commerce_app/features/cart/presentation/screens/widgets/cart_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductList extends StatelessWidget {
  final List<CartItemEntity> cartItems;
  const CartProductList({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => CartProductItem(
          cartItems[index],
        ),
        itemCount: cartItems.length,
      ),
    );
  }
}
