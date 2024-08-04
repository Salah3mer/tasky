import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/config/styles/app_fonts.dart';
import 'package:tasky/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:tasky/features/home/presentation/widget/tabbar_list.dart';
import 'package:tasky/features/home/presentation/widget/task_list_view.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.scroll,
  });

  final ScrollController scroll;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {

          if(state is HomeErrorState){
             showTopSnackBar(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              Overlay.of(context),
              CustomSnackBar.error(
                  maxLines: 5,
                  message:
                      ' There is An Error. You need to do something with that ${state.errorMessage} '));
          }
      },
      builder: (context, state) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return SingleChildScrollView(
              controller: scroll,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Tasks',
                      style: AppFonts.font16BoldColorDark(context),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: SizedBox(height: 50, child: TabBarList()),
                    ),
                    TaskListView(
                      tasks: HomeCubit.get(context).filterdList,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
