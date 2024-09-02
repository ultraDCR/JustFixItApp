abstract class NetworkState<T> {}

class NetworkSuccessful<T> extends NetworkState<T> {
  final T data;
  NetworkSuccessful({required this.data});
}

class NetworkError<String> extends NetworkState<String> {
  final String? errorMessage;
  NetworkError({this.errorMessage});
}
