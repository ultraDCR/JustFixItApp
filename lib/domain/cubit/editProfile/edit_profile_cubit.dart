import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_fix_it/data/repositories/auth_repository.dart';
import 'package:just_fix_it/data/repositories/service_repository.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final AuthRepository authRepository;

  EditProfileCubit({required this.authRepository}) : super(EditProfileInitial());


  void editProfile({required String newName, required String newAddress}) async {
    emit(EditProfileLoading());
    try {
      dynamic authDto = await authRepository.updateCurrentUser(
        name: newName,
        address: newAddress,
      );
      if (authDto != null) {
        emit(EditProfileSuccessful(authData: authDto));
      } else {
        emit(const EditProfileError(message: "Something went wrong"));
      }
    } catch (e) {

      print('EditProfile cubit error:$e');
      emit(EditProfileError(message: e.toString()));
    }
  }

}
