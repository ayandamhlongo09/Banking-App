import 'package:banking_app/helpers/exceptions/network_exceptions.dart';
import 'package:banking_app/helpers/exceptions/user_exceptions.dart';
import 'package:banking_app/models/login_response.dart';
import 'package:banking_app/models/user.dart';
import 'package:banking_app/services/core/connectivity/connectivity.dart';
import 'package:banking_app/services/datasources/user/user_data_source.dart';
import 'package:flutter/material.dart';
import '../user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;
  final ConnectivityInfo connectivityInfo;

  UserRepositoryImpl(
      {@required this.userDataSource, @required this.connectivityInfo});

  @override
  Future<bool> isConnected() {
    return connectivityInfo.isConnected;
  }

  @override
  Future<LoginResponse> login(String email, String password) async {
    if (await connectivityInfo.isConnected) {
      LoginResponse loginResponse = await userDataSource.login(email, password);
      if (loginResponse == null) {
        throw BadRequest("Something went wrong");
      }
      return loginResponse;
    } else {
      throw NoInternetException();
    }
  }
  Future<User> getClientDetails(localId, tokenId) async {
     if (await connectivityInfo.isConnected) {
      User user = await userDataSource.getClientDetails(localId, tokenId);
      if (user == null) {
        throw BadRequest("Something went wrong");
      }
      return user;
    } else {
      throw NoInternetException();
    }

  }
}
