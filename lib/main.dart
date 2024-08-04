import 'package:flutter/material.dart';
import 'package:tasky/config/router/app_router.dart';
import 'package:tasky/config/router/routes.dart';
import 'package:tasky/config/styles/light_theme.dart';
import 'package:tasky/core/utils/app_constans.dart';
import 'package:tasky/core/utils/local/cash_helper.dart';
import 'package:tasky/core/utils/server_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  getItSetup();
  AppConstans.token = CashHelper.getString(key: AppConstans.tokenKey);
  AppConstans.reFreshtoken =
      CashHelper.getString(key: AppConstans.reFreshtokenKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
 
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      onGenerateRoute: AppRouter.onGenratingRoute,
      initialRoute: Routes.initalRoute,
    );
  }
}
