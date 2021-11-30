import 'package:banking_app/models/login_response.dart';
import 'package:banking_app/models/user.dart';

abstract class UserRepository {
  Future<bool> isConnected();
  Future<LoginResponse> login(String email, String password);
  Future<User> getClientDetails(localId, tokenId);
}
