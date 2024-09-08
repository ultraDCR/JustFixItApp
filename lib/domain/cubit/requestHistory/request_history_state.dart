part of 'request_history_cubit.dart';


abstract class RequestHistoryState extends Equatable {
  const RequestHistoryState();
}

class RequestHistoryInitial extends RequestHistoryState {
  @override
  List<Object> get props => [];
}

class RequestHistoryLoading extends RequestHistoryState {
  @override
  List<Object> get props => [];
}

class RequestHistorySuccessful extends RequestHistoryState {
  final List<RequestHistory> requestHistory;
  const RequestHistorySuccessful({required this.requestHistory});
  @override
  List<Object> get props => [requestHistory];
}

class RequestHistoryError extends RequestHistoryState {
  final String message;
  const RequestHistoryError({required this.message});
  @override
  List<Object> get props => [message];
}