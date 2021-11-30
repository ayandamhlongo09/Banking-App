//Server error. actual login error
class LoginFailed implements Exception {
  final String responseBody;
  LoginFailed(this.responseBody);

  @override
  String toString() => responseBody;
}

//issues with data sent
class BadRequest implements Exception {
  final String responseBody;
  BadRequest(this.responseBody);

  @override
  String toString() => "Error!: " + responseBody;
}

