import 'package:e_commerce_app/core/app_constants/app_constants.dart';
import 'package:e_commerce_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductItem extends StatelessWidget {
  final CartItemEntity cart;
  const CartProductItem(this.cart, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(8),
      width: 343.w,
      height: 117.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppConstants.kGreyColor),
      ),
      child: Row(
        children: [
          Image.network(
            cart.product.imgCover ?? '',
            width: 96.w,
            height: 101.h,
            fit: BoxFit.contain,
          ),
          8.horizontalSpace,
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.5.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cart.product.title ?? '',
                          style: theme.textTheme.bodyMedium,
                        ),
                        Text(
                          cart.product.description ?? '',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.delete_outline_sharp,
                      color: Colors.red,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "EGP ${cart.product.price}",
                      style: theme.textTheme.bodyMedium,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.minimize_outlined,
                            size: 14.sp,
                          ),
                        ),
                        13.horizontalSpace,
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            size: 14.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
