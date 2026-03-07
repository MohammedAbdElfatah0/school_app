import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/courses_model.dart';
import '../../data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitialState());

  final HomeRepo homeRepo;

  Future<void> getCourses() async {
    emit(HomeLoadingState());
    final result = await homeRepo.getCourses();
    result.fold(
      (l) => emit(HomeErrorState(l)),
      (r) => emit(HomeSuccessState(r)),
    );
  }
}
