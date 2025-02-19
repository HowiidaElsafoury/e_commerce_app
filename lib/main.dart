import 'package:e_commerce_app/core/utilis/app_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';
import 'core/routing/app_router.dart';
import 'core/theme/application_theme.dart';
import 'features/layout/presentation/layout_view.dart';

void main() {
  configureDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ApplicationTheme.lightTheme,
          initialRoute: LayoutView.routeName,
          onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
        );
      },
    );
  }
}
