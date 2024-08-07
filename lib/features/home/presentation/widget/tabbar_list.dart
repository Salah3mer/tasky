import 'package:flutter/material.dart';
import 'package:tasky/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:tasky/features/home/presentation/widget/tabbar_item.dart';

class TabBarList extends StatefulWidget {
  const TabBarList({super.key});

  @override
  State<TabBarList> createState() => _TabBarListState();
}

class _TabBarListState extends State<TabBarList> {
  final items = ['All', 'Inprogress', 'Waiting', 'Finished'];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) => InkWell(
          borderRadius: BorderRadius.circular(20) ,
          onTap: () {
            setState(() {
              currentIndex = index;
            });

            HomeCubit.get(context).getFilterList(items[index].toLowerCase());
          },
          child: IntrinsicWidth(
              child: TabBarItem(
                  tapName: items[index], isActive: currentIndex == index))),
      separatorBuilder: (context, index) => const SizedBox(
        width: 5,
      ),
    );

    return Row(
        children: items.asMap().entries.map((e) {
      int index = e.key;
      var item = e.value;
      return Expanded(
        child: InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
          },
          child: TabBarItem(tapName: item, isActive: currentIndex == index),
        ),
      );
    }).toList());
  }
}
