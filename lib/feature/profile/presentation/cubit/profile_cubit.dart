import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/user_model.dart';
import '../../data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitialState());

  final ProfileRepo profileRepo;

  Future<void> getUserProfile() async {
    emit(ProfileLoadingState());
    final result = await profileRepo.getUserProfile();
    result.fold(
      (l) => emit(ProfileErrorState(l)),
      (r) => emit(ProfileSuccessState(r)),
    );
  }
}
