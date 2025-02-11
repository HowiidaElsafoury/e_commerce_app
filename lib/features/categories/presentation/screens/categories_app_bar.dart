import 'package:e_commerce_app/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CategoriesAppBar({super.key});

  @override
  State<CategoriesAppBar> createState() => _CategoriesAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 25.h);
}

class _CategoriesAppBarState extends State<CategoriesAppBar> {
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
                    context.read<LayoutCubit>().navigateToPrevPage();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: theme.textTheme.titleLarge,
                  ),
                  2.verticalSpace,
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
