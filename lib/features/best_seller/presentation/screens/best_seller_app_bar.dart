import 'package:e_commerce_app/core/app_constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerAppBar extends StatefulWidget implements PreferredSizeWidget {
  const BestSellerAppBar({super.key});

  @override
  State<BestSellerAppBar> createState() => _BestSellerAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 25.h);
}

class _BestSellerAppBarState extends State<BestSellerAppBar> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          14.verticalSpace,
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Best Seller",
                    style: theme.textTheme.titleLarge,
                  ),
                  2.verticalSpace,
                  Text(
                    "Bloom with our exquisite best sellers",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: AppConstants.kGreyColor),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
