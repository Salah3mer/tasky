import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasky/features/profile/data/model/profile_model.dart';
import 'package:tasky/features/profile/data/repository/profile_repository_impl.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepositoryImpl profileRepositoryImpl;
  ProfileCubit(this.profileRepositoryImpl) : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    final response = await profileRepositoryImpl.getProfile();
    response
        .fold((error) => emit(ProfileErrorState(errorMessage: error.message!)),
            (profile) {
      print(profile.toString());
      emit(ProfileSuccessState(profile: profile));
    });
  }
}
