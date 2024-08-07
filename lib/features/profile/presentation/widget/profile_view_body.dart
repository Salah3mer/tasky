import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:tasky/features/profile/presentation/widget/custom_profile_container_widget.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccessState) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 22),
            child: Column(
              children: [
                CustomProfileContainerWidget(
                  name: 'Name',
                  text: state.profile.displayName!,
                ),
                const SizedBox(height: 5),
                CustomProfileContainerWidget(
                  name: 'Phone',
                  text: state.profile.username!,
                  isPhone: true,
                ),
                const SizedBox(height: 5),
                CustomProfileContainerWidget(
                  name: 'Level',
                  text: state.profile.level!,
                ),
                const SizedBox(height: 5),
                CustomProfileContainerWidget(
                    name: 'Years of experience',
                    text: '${state.profile.experienceYears} Years'),
                const SizedBox(height: 5),
                CustomProfileContainerWidget(
                    name: 'Location', text: state.profile.address!),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

