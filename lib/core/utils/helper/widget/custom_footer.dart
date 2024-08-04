import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tasky/config/styles/app_colors.dart';

class CustomFooterWidget extends StatelessWidget {
  const CustomFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFooter(builder: (BuildContext context, LoadStatus? mode) {
      Widget body;
      if (mode == LoadStatus.loading) {
        body = CircularProgressIndicator(color: AppColor.primaryColor);
      } else if (mode == LoadStatus.idle) {
        body = const Text("");
      } else if (mode == LoadStatus.failed) {
        body = const Text(
          "Load Failed!Click retry!",
          style: TextStyle(color: Colors.white),
        );
      } else if (mode == LoadStatus.canLoading) {
        body = const Text(
          "release to load more",
          style: TextStyle(color: Colors.white),
        );
      } else if (mode == LoadStatus.noMore) {
        body = const Center(
            child: Text(
          "No more data",
          style: TextStyle(color: Colors.white),
        ));
      } else {
        body = const Text(
          "Load more",
          style: TextStyle(color: Colors.white),
        );
      }
      return SizedBox(
        height: 55.0,
        width: double.infinity,
        child: Center(child: body),
      );
    });
  }
}
