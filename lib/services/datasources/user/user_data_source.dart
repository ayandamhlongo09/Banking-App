import 'package:banking_app/models/login_response.dart';
import 'package:banking_app/models/user.dart';

abstract class UserDataSource {
  Future<LoginResponse> login(String email, String password);
  Future<User> getClientDetails(localId, tokenId);
}
