import 'package:e_commerce_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_constants/app_constants.dart';

class CartProductPrice extends StatelessWidget {
  final CartItemEntity cart;
  const CartProductPrice(this.cart, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sub Total",
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: AppConstants.kGreyColor),
            ),
            Text("${cart.price} \$"),
          ],
        ),
        8.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery Fee",
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: AppConstants.kGreyColor),
            ),
            Text("${cart.price} \$"),
          ],
        ),
        8.verticalSpace,
        Divider(
          color: AppConstants.kGreyColor,
          thickness: 0.5.h,
          height: 8.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              " Total",
              style: theme.textTheme.bodyLarge,
            ),
            Text("${cart.price} \$"),
          ],
        ),
      ],
    );
  }
}
