import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/config/router/routes.dart';
import 'package:tasky/core/utils/api/dio_client.dart';
import 'package:tasky/core/utils/server_locator.dart';
import 'package:tasky/features/auth/data/repository/auth_repository_impl.dart';
import 'package:tasky/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:tasky/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:tasky/features/auth/presentation/view/login_view.dart';
import 'package:tasky/features/auth/presentation/view/register_view.dart';
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
      case Routes.registerView:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => RegisterCubit(getIt()),
                  child: const RegisterView(),
                )));
      case Routes.loginView:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => LoginCubit(getIt()),
                  child: const LoginView(),
                )));
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
