import 'dart:convert';

import 'package:banking_app/helpers/api.dart';
import 'package:banking_app/helpers/exceptions/network_exceptions.dart';
import 'package:banking_app/helpers/exceptions/user_exceptions.dart';
import 'package:banking_app/models/login_response.dart';
import 'package:banking_app/models/user.dart';
import '../user_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'dart:io';

class UserDataSourceImpl implements UserDataSource {
  final Duration timeout;

  UserDataSourceImpl({
    this.timeout = const Duration(seconds: 30),
  });

  //-------------------------------api requests-----------------------------------------

  @override
  Future<LoginResponse> login(String email, String password) async {
    String baseUrl =
        "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyAR4Yezxk7Ao4qeFntu7tIvE7pH28Eh64Y";

    var body = jsonEncode({
      "email": email,
      "password": password,
      "returnSecureToken": true,
    });

    final response = await http
        .post(
      path.url.join(baseUrl),
      body: body,
      headers: HttpHeaderUtils.setContentTypeJSON({}),
    )
        .timeout(timeout, onTimeout: () {
      throw NetworkTimeoutException();
    });

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponse.fromRawJson(response.body);
    } else {
      throw LoginFailed(response.body);
    }
  }

  Future<User> getClientDetails(localId, tokenId) async {
    String baseUrl =
        "https://momentum-retail-practical-test.firebaseio.com/clients";

    var url =
        Uri.http(baseUrl, localId + ".json", {"auth": tokenId.toString()});

    final response = await http
        .get(
      url,
    )
        .timeout(timeout, onTimeout: () {
      throw NetworkTimeoutException();
    });

    if (response.statusCode == HttpStatus.ok) {
      return User.fromRawJson(response.body);
    } else {
      throw LoginFailed(response.body);
    }
  }
}
