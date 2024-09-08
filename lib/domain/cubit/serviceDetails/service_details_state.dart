part of 'service_details_cubit.dart';

sealed class ServiceDetailsState extends Equatable {
  const ServiceDetailsState();
}

class ServiceDetailsInitial extends ServiceDetailsState {
  @override
  List<Object> get props => [];
}

class ServiceDetailsLoading extends ServiceDetailsState {
  @override
  List<Object> get props => [];
}

class ServiceRequestSuccessful extends ServiceDetailsState {
  final Request requestData;
  const ServiceRequestSuccessful({required this.requestData});
  @override
  List<Object> get props => [requestData];
}

class ServiceDetailsError extends ServiceDetailsState {
  final String message;
  const ServiceDetailsError({required this.message});
  @override
  List<Object> get props => [message];
}
