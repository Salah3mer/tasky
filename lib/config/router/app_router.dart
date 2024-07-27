import 'package:flutter/material.dart';
import 'package:tasky/config/router/routes.dart';
import 'package:tasky/features/auth/presentation/view/login_view.dart';
import 'package:tasky/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:tasky/features/splash/presentation/view/splash_view.dart';

class AppRouter extends Routes {
  static Route? onGenratingRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initalRoute:
        return MaterialPageRoute(builder: ((context) => const SplashView()));
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: ((context) => const OnBoardingView()));
      case Routes.loginView:
        return MaterialPageRoute(builder: ((context) => const LoginView()));
      default:
        return onRouteError();
    }
  }

  static Route<dynamic> onRouteError() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text('No Route Found'),
              ),
            )));
  }
}
