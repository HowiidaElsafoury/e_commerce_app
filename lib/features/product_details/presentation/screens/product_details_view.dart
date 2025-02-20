import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:e_commerce_app/core/shared_widgets/custom_button.dart';
import 'package:e_commerce_app/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cart/presentation/cubit/cart_cubit.dart';

class ProductDetailsView extends StatefulWidget {
  static const String routeName = "Product details view";
  final String productId;
  const ProductDetailsView({super.key, required this.productId});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  late ProductDetailsCubit viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = context.read<ProductDetailsCubit>();

    viewModel.getProductDeatils(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsFailure) {
          return Text(state.message);
        } else if (state is ProductDetailsLoading) {
          return const CircularProgressIndicator();
        } else if (state is ProductDetailsSuccess) {
          final product = state.productEntity;
          return Scaffold(
            body: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 450.h,
                      width: double.infinity,
                      child: AnotherCarousel(
                          images: product.images
                              .map(
                                (e) => Image.network(
                                  e,
                                  fit: BoxFit.cover,
                                ),
                              )
                              .toList()),
                    ),
                    Positioned(
                      top: 32.h,
                      left: 24.w,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 32.r,
                        ),
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "EGP ${product.priceAfterDiscount}",
                        style: theme.textTheme.bodyLarge,
                      ),
                      4.verticalSpace,
                      Text(
                        "All prices include tax",
                        style: theme.textTheme.bodySmall,
                      ),
                      8.verticalSpace,
                      Text(
                        product.title ?? '',
                        style: theme.textTheme.bodyMedium,
                      ),
                      24.verticalSpace,
                      Text(
                        "Description",
                        style: theme.textTheme.bodyMedium,
                      ),
                      8.verticalSpace,
                      Text(product.description ?? ""),
                      24.verticalSpace,
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          bool isLoading = false;
                          if (state is AddCartLoading) {
                            isLoading = true;
                          }
                          return CustomButton(
                            onTap: () => context
                                .read<CartCubit>()
                                .addCartData(widget.productId, 1),
                            buttonText: "Add to Cart",
                            isLoading: isLoading,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
