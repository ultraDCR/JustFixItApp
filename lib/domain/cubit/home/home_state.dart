part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class ServiceListLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class ServiceListSuccessful extends HomeState {
  final List<Service> serviceList;
  const ServiceListSuccessful({required this.serviceList});
  @override
  List<Object> get props => [serviceList];
}

class ServiceError extends HomeState {
  final String message;
  const ServiceError({required this.message});
  @override
  List<Object> get props => [message];
}