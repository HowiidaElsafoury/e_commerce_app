import 'package:e_commerce_app/features/best_seller/presentation/cubit/best_seller_cubit.dart';
import 'package:e_commerce_app/features/search/presentation/cubits/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/auth/cubits/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/auth/cubits/register_cubit/register_cubit.dart';
import '../../features/auth/presentation/auth/pages/login_view.dart';
import '../../features/auth/presentation/auth/pages/register_view.dart';
import '../../features/best_seller/presentation/screens/best_seller_view.dart';
import '../../features/cart/presentation/cubit/cart_cubit.dart';
import '../../features/categories/presentation/cubit/categories_cubit.dart';
import '../../features/home/presentation/cubits/home_cubits/home_cubit.dart';
import '../../features/layout/presentation/cubit/layout_cubit.dart';
import '../../features/layout/presentation/layout_view.dart';
import '../../features/product_details/presentation/cubit/product_details_cubit.dart';
import '../../features/product_details/presentation/screens/product_details_view.dart';
import '../../features/search/presentation/screens/search_screen.dart';
import '../di/di.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    // ForgetPasswordCubit? forgetPasswordCubit;

    // createForgetPassword() {
    //   forgetPasswordCubit ??= getIt<ForgetPasswordCubit>();
    // }

    switch (setting.name) {
      case LoginView.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginView(),
          ),
        );

      case RegisterView.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterView(),
          ),
        );
      case LayoutView.routeName:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => LayoutCubit(),
              ),
              BlocProvider(
                create: (context) => getIt<HomeCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<CategoriesCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<CartCubit>()..getCartData(),
              ),
            ],
            child: const LayoutView(),
          ),
        );
      case SearchScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SearchCubit>(),
            child: const SearchScreen(),
          ),
        );

      case BestSellerView.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<BestSellerCubit>(),
            child: const BestSellerView(),
          ),
        );
      case ProductDetailsView.routeName:
        final String productId = setting.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ProductDetailsCubit>(),
            child: ProductDetailsView(productId: productId),
          ),
          settings: setting,
        );
      // return MaterialPageRoute(
      //   builder: (context) => BlocProvider(
      //     create: (context) => getIt<ProductDetailsCubit>(),
      //     child: const ProductDetailsView(),
      //   ),
      // );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}
