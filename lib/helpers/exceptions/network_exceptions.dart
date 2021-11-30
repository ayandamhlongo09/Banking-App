class NetworkTimeoutException implements Exception {
  final String responseBody;
  NetworkTimeoutException(
      [this.responseBody =
          "This request took too long. Please ensure you have a stable internet connection and try again"]);

  @override
  String toString() => responseBody;
}

class NoInternetException implements Exception {
  NoInternetException([String message = "No internet connection!"]);
}
