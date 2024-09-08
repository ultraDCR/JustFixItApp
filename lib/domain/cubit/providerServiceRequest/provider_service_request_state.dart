part of 'provider_service_request_cubit.dart';

sealed class ProviderServiceRequestState extends Equatable {
  const ProviderServiceRequestState();
}

final class ProviderServiceRequestInitial extends ProviderServiceRequestState {
  @override
  List<Object> get props => [];
}

class ProviderServiceRequestLoading extends ProviderServiceRequestState {
  @override
  List<Object> get props => [];
}

class ProviderServiceRequestSuccessful extends ProviderServiceRequestState {
  final List<ServiceRequest> providerServiceRequest;
  const ProviderServiceRequestSuccessful({required this.providerServiceRequest});
  @override
  List<Object> get props => [providerServiceRequest];
}

class ProviderServiceRequestError extends ProviderServiceRequestState {
  final String message;
  const ProviderServiceRequestError({required this.message});
  @override
  List<Object> get props => [message];
}

