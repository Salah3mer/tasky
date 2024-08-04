import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tasky/core/utils/helper/widget/custom_footer.dart';
import 'package:tasky/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:tasky/features/home/presentation/widget/custom_floating_button.dart';
import 'package:tasky/features/home/presentation/widget/custom_home_appbar.dart';
import 'package:tasky/features/home/presentation/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  ScrollController scroll = ScrollController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customHomeAppBar(context),
        body: SmartRefresher(
          footer: const CustomFooterWidget(),
          onRefresh: () async {
            await Future.delayed(const Duration(milliseconds: 1000));
            _refreshController.refreshCompleted();
          },
          onLoading: () async {
            await Future.delayed(const Duration(milliseconds: 1000));
            // ignore: use_build_context_synchronously
            HomeCubit.get(context).getTasks();
            _refreshController.loadComplete();
          },
          enablePullUp: true,
          controller: _refreshController,
          child: HomeViewBody(scroll: scroll),
        ),
        floatingActionButton: const CustomFloatingButtons());
  }
}
