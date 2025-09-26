import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/get_it_config.dart';
import 'package:movies_app/core/navigation/app_router.dart';
import 'package:movies_app/features/home/logic/cubit/home_cubit.dart';
import 'package:movies_app/features/home/view/ui/home_screen.dart';
import 'package:movies_app/features/splash_screen/splash_screen.dart';

class AppRouterConfig {
  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRouter.splashScreen:
        return MaterialPageRoute(
          builder: (context) {
            return SplashScreen();
          },
        );
      case AppRouter.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => getIt<HomeMoviesCubit>(),
              child: HomeScreen(),
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(child: Text("${setting.name} NOT Found...")),
            );
          },
        );
    }
  }
}
