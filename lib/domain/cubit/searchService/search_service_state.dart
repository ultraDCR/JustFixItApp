part of 'search_service_cubit.dart';

abstract class SearchServiceState extends Equatable {
  const SearchServiceState();
}

class SearchServiceInitial extends SearchServiceState {
  @override
  List<Object> get props => [];
}

class SearchServiceLoading extends SearchServiceState {
  @override
  List<Object> get props => [];
}

class SearchServiceSuccessful extends SearchServiceState {
  final List<Service> searchService;
  const SearchServiceSuccessful({required this.searchService});
  @override
  List<Object> get props => [searchService];
}

class SearchServiceError extends SearchServiceState {
  final String message;
  const SearchServiceError({required this.message});
  @override
  List<Object> get props => [message];
}