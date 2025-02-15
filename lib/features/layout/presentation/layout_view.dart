import 'package:e_commerce_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:e_commerce_app/features/categories/presentation/screens/categories_view.dart';
import 'package:e_commerce_app/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_constants/app_constants.dart';
import '../../../core/di/di.dart';
import '../../home/presentation/cubits/home_cubits/home_cubit.dart';
import '../../home/presentation/screens/home_view.dart';

class LayoutView extends StatefulWidget {
  static const String routeName = "layout view";
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  late final LayoutCubit _layoutCubit;

  List<Widget> screensTab = [];
  @override
  void initState() {
    super.initState();
    _layoutCubit = context.read<LayoutCubit>();
    screensTab = [
      BlocProvider(
        create: (context) => getIt<HomeCubit>(),
        child: const HomeView(),
      ),
      BlocProvider(
        create: (context) => getIt<CategoriesCubit>(),
        child: CategoriesView(
          categoryId: _layoutCubit.selectedCategoryId,
        ),
      ),
      SizedBox(
        child: IconButton(
            onPressed: () {
              context.read<LayoutCubit>().navigateToPrevPage();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      const SizedBox(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          body: PageView(
            controller: _layoutCubit.controller,
            physics: const NeverScrollableScrollPhysics(),
            children: screensTab,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              if (index == 1) {
                _layoutCubit.navigateToCategoryTap("");
              } else {
                _layoutCubit.navigateTo(index);
              }
              setState(() {});
            },
            currentIndex: _layoutCubit.currentPageIndex,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/home_bottom_navigation_bar.svg",
                  colorFilter: ColorFilter.mode(
                      _layoutCubit.currentPageIndex == 0
                          ? AppConstants.kprimaryColor
                          : AppConstants.kGreyColor,
                      BlendMode.srcIn),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/category_bottom_navigation_bar.svg",
                  colorFilter: ColorFilter.mode(
                      _layoutCubit.currentPageIndex == 1
                          ? AppConstants.kprimaryColor
                          : AppConstants.kGreyColor,
                      BlendMode.srcIn),
                ),
                label: "Category",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/shopping_cart_BNB.svg",
                  colorFilter: ColorFilter.mode(
                      _layoutCubit.currentPageIndex == 2
                          ? AppConstants.kprimaryColor
                          : AppConstants.kGreyColor,
                      BlendMode.srcIn),
                ),
                label: "Shopping",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/profile_bottom_navigation_bar.svg",
                  colorFilter: ColorFilter.mode(
                      _layoutCubit.currentPageIndex == 3
                          ? AppConstants.kprimaryColor
                          : AppConstants.kGreyColor,
                      BlendMode.srcIn),
                ),
                label: "Profile",
              )
            ],
          ),
        );
      },
    );
  }
}
