import 'package:flutter/material.dart';
import 'package:tasky/config/router/app_router.dart';
import 'package:tasky/config/router/routes.dart';
import 'package:tasky/core/utils/local/cash_helper.dart';
import 'package:tasky/features/auth/presentation/view/login_view.dart';
import 'package:tasky/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:tasky/features/splash/presentation/view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter.onGenratingRoute,
      initialRoute: Routes.initalRoute,
    );
  }
}
