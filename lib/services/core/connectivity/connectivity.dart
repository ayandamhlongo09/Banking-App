import 'dart:async';

abstract class ConnectivityInfo {
  Future<bool> get isConnected;
  Future<void> dispose();
}
