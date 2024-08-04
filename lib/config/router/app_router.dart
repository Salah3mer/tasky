import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/config/router/routes.dart';
import 'package:tasky/core/utils/server_locator.dart';
import 'package:tasky/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:tasky/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:tasky/features/auth/presentation/view/login_view.dart';
import 'package:tasky/features/auth/presentation/view/register_view.dart';
import 'package:tasky/features/home/data/models/task_model.dart';
import 'package:tasky/features/home/presentation/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:tasky/features/home/presentation/view/home_view.dart';
import 'package:tasky/features/home/presentation/view/new_task_view.dart';
import 'package:tasky/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:tasky/features/splash/presentation/view/splash_view.dart';
import 'package:tasky/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:tasky/features/task/presentation/cubit/task_cubit.dart';
import 'package:tasky/features/task/presentation/view/task_view.dart';

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
      case Routes.homeView:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => HomeCubit(getIt())
                    ..getTasks()
                    ..getFilterList('all'),
                  child: HomeView(),
                )));
      case Routes.newTask:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => AddTaskCubit(
                    getIt(),
                  ),
                  child: const NewTaskView(),
                )));

      case Routes.task:
        final task = settings.arguments as TaskModel;

        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => TaskCubit(getIt()),
                  child: TaskView(
                    taskModel: task,
                  ),
                ));
                
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
