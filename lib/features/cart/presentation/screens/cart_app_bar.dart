import 'package:e_commerce_app/core/app_constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../layout/presentation/cubit/layout_cubit.dart';
import '../cubit/cart_cubit.dart';

class CartAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  State<CartAppBar> createState() => _CartAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 25.h);
}

class _CartAppBarState extends State<CartAppBar> {
  late final CartCubit cartCubit;
  @override
  void initState() {
    super.initState();
    cartCubit = context.read<CartCubit>();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    context.read<LayoutCubit>().navigateTo(0);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              Text(
                " Cart",
                style: theme.textTheme.titleLarge,
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return Text(
                    "\t(${cartCubit.cart?.numOfCartItems ?? ''} items)",
                    style: theme.textTheme.titleLarge!
                        .copyWith(color: AppConstants.kGreyColor),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
