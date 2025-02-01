import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/auth/cubits/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/auth/cubits/register_cubit/register_cubit.dart';
import '../../features/auth/presentation/auth/pages/login_view.dart';
import '../../features/auth/presentation/auth/pages/register_view.dart';
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
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}
