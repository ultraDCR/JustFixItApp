part of 'add_service_cubit.dart';


abstract class AddServiceState extends Equatable {
  const AddServiceState();
}

class AddServiceInitial extends AddServiceState {
  @override
  List<Object> get props => [];
}

class AddServiceLoading extends AddServiceState {
  @override
  List<Object> get props => [];
}

class AddServiceSuccessful extends AddServiceState {
  final dynamic serviceData;
  const AddServiceSuccessful({required this.serviceData});
  @override
  List<Object> get props => [serviceData];
}

class AddServiceError extends AddServiceState {
  final String message;
  const AddServiceError({required this.message});
  @override
  List<Object> get props => [message];
}

