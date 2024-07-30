import 'package:flutter/material.dart';
import 'package:tasky/features/home/presentation/view/widget/tabbar_item.dart';

class TabBarList extends StatefulWidget {
  const TabBarList({Key? key}) : super(key: key);

  @override
  State<TabBarList> createState() => _TabBarListState();
}

class _TabBarListState extends State<TabBarList> {
  final items = ['All', 'Inpogress', 'Waiting', 'Finished'];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) =>
          InkWell(
              onTap: () => setState(() {
                currentIndex = index;
              }),
              child: IntrinsicWidth(child: TabBarItem(tapName: items[index], isActive: currentIndex == index))),
      separatorBuilder: (context, index) => SizedBox(
        width: 15,
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
