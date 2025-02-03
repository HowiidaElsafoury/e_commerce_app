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
  int selectedIndex = 0;

  List<Widget> screensTab = [];
  @override
  void initState() {
    super.initState();
    screensTab = [
      BlocProvider(
        create: (context) => getIt<HomeCubit>(),
        child: const HomeView(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: screensTab.length,
        onPageChanged: (value) {},
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => screensTab[index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home_bottom_navigation_bar.svg",
              colorFilter: ColorFilter.mode(
                  selectedIndex == 0
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
                  selectedIndex == 1
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
                  selectedIndex == 2
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
                  selectedIndex == 3
                      ? AppConstants.kprimaryColor
                      : AppConstants.kGreyColor,
                  BlendMode.srcIn),
            ),
            label: "Profile",
          )
        ],
      ),
    );
  }
}
