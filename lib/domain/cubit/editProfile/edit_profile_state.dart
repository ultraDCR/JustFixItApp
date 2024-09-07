part of 'edit_profile_cubit.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();
}

final class EditProfileInitial extends EditProfileState {
  @override
  List<Object> get props => [];
}



class EditProfileLoading extends EditProfileState {
  @override
  List<Object> get props => [];
}

class EditProfileSuccessful extends EditProfileState {
  final dynamic authData;
  const EditProfileSuccessful({required this.authData});
  @override
  List<Object> get props => [authData];
}

class EditProfileError extends EditProfileState {
  final String message;
  const EditProfileError({required this.message});
  @override
  List<Object> get props => [message];
}

