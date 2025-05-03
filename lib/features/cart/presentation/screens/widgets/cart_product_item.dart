import 'package:e_commerce_app/core/app_constants/app_constants.dart';
import 'package:e_commerce_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:e_commerce_app/features/cart/presentation/cubits/cubit/cart_functions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductItem extends StatelessWidget {
  final CartItemEntity? cart;
  const CartProductItem(this.cart, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Container(
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
              cart?.product?.imgCover ?? '',
              width: 96.w,
              height: 101.h,
              fit: BoxFit.contain,
            ),
            8.horizontalSpace,
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          cart?.product?.title ?? '',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       cart?.product?.title ?? '',
                      //       style: theme.textTheme.bodyMedium,
                      //     ),
                      //     Text(
                      //       cart?.product?.description ?? '',
                      //       style: theme.textTheme.bodySmall!
                      //           .copyWith(color: AppConstants.kGreyColor),
                      //     ),
                      //   ],
                      // ),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<CartFunctionsCubit>()
                              .deleteCartData(cart?.product?.id ?? "");
                        },
                        child: const Icon(
                          Icons.delete_outline_sharp,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 115.w,
                        child: Text(
                          "EGP ${cart?.product?.price}",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              context.read<CartFunctionsCubit>().updateCartData(
                                  cart?.product?.id ?? "",
                                  (cart?.quantity ?? 1) - 1);
                            },
                            icon: Icon(
                              Icons.remove,
                              size: 16.sp,
                            ),
                          ),
                          Text(cart?.quantity.toString() ?? ""),
                          IconButton(
                            onPressed: () {
                              context.read<CartFunctionsCubit>().updateCartData(
                                  cart?.product?.id ?? "",
                                  (cart?.quantity ?? -1) + 1);
                            },
                            icon: Icon(
                              Icons.add,
                              size: 16.sp,
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
      ),
    );
  }
}
