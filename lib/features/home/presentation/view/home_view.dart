import 'package:flutter/material.dart';
import 'package:tasky/config/styles/app_fonts.dart';
import 'package:tasky/features/home/presentation/view/widget/custom_floating_button.dart';
import 'package:tasky/features/home/presentation/view/widget/custom_home_appbar.dart';
import 'package:tasky/features/home/presentation/view/widget/tabbar_list.dart';
import 'package:tasky/features/home/presentation/view/widget/task_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customHomeAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Tasks',
                  style: AppFonts.font16BoldColorDark(context),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
                  child: SizedBox(height: 50, child: TabBarList()),
                ),
                const TaskItem()
              ],
            ),
          ),
        ),
        floatingActionButton: const CustomFloatingButtons());
  }
}
