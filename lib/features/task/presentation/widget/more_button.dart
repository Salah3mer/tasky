import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:popover/popover.dart';
import 'package:tasky/features/task/presentation/cubit/task_cubit.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final taskCubit = TaskCubit.get(context);
      return InkWell(
          onTap: () => showPopover(
              context: context,
              width: 60,
              height: 100,
              backgroundColor: Colors.white,
              arrowHeight: 14,
              arrowWidth: 10,
              barrierColor: Colors.transparent,
              direction: PopoverDirection.bottom,
              bodyBuilder: (context) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            taskCubit.editTask();
                          },
                          child: const Text('Edit'),
                        ),
                        const Divider(),
                        InkWell(
                          onTap: () {
                            taskCubit.deleteTask();
                          },
                          child: const Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      ])),
          child: const Icon(FontAwesomeIcons.ellipsisVertical));
    });
  }
}
