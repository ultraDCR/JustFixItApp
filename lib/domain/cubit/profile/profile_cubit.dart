import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_fix_it/data/models/api_response/user.dart';

import '../../../data/repositories/auth_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthRepository authRepository;

  ProfileCubit({required this.authRepository}) : super(ProfileInitial()){fetchCurrentUser();}

  void fetchCurrentUser() async {
    emit(ProfileLoading());
    try {
      User profileDto = await authRepository.getCurrentUser();
      if (profileDto != null) {
        print(profileDto);

        emit(ProfileSuccessful(profileData: profileDto));
      } else {
        emit(const ProfileError(message: "Something went wrong"));
      }
    } catch (e) {

      print('Profile cubit error:$e');
      emit(ProfileError(message: e.toString()));
    }
  }


}
