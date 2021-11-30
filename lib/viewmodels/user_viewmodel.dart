import 'package:banking_app/models/login_response.dart';
import 'package:banking_app/models/user.dart';
import 'package:banking_app/services/repositories/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'base_viewmodel.dart';

class UserViewModel extends ChangeNotifier implements BaseViewModel {
  final UserRepository _repository;

  bool _isOnline = true;
  User _user;

  LoginResponse _loginResponse;

  UserViewModel({
    @required UserRepository repository,
  }) : this._repository = repository;

  bool isConnected() {
    _repository.isConnected().then((value) {
      _isOnline = value;
      notifyListeners();
    });
    return _isOnline;
  }

  Future<LoginResponse> login(email, password) async {
    _loginResponse = await _repository.login(email, password);
    notifyListeners();
    return _loginResponse;
  }

  Future<User> getClientDetails(localId, tokenId) async {
    _user = await _repository.getClientDetails(localId, tokenId);
    notifyListeners();
    return _user;
  }

  User get user => _user;
  LoginResponse get loginResponse => _loginResponse;

  @override
  void reset() {}
}
