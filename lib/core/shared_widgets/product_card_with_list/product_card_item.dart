import 'package:e_commerce_app/core/app_constants/app_constants.dart';
import 'package:e_commerce_app/core/shared_widgets/custom_card_button.dart';
import 'package:e_commerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features/product_details/presentation/screens/product_details_view.dart';

class ProductCardItem extends StatelessWidget {
  final HomeProductEntity bestSellerProduct;
  const ProductCardItem({super.key, required this.bestSellerProduct});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        ProductDetailsView.routeName,
        arguments: bestSellerProduct.id,
      ),
      child: Container(
        width: 163.w,
        height: 229.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppConstants.kGreyColor),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Image.network(
              bestSellerProduct.imgCover ?? "",
              width: 147.h,
              height: 131.h,
              fit: BoxFit.cover,
            ),
            8.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bestSellerProduct.title ?? '',
                    style: theme.textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text('${bestSellerProduct.priceAfterDiscount} EGP',
                          style: theme.textTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
            ),
            8.verticalSpace,
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                bool isLoading = false;
                if (state is AddCartLoading) {
                  isLoading = true && state.productId == bestSellerProduct.id;
                }
                return CustomCardButtom(
                  onTap: () => context
                      .read<CartCubit>()
                      .addCartData(bestSellerProduct.id ?? "", 1),
                  buttonText: "Add to Cart",
                  isLoading: isLoading,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
