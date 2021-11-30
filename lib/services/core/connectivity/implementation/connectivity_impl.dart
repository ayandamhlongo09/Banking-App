import 'dart:async';
import 'package:banking_app/constants/connectivity_types.dart';
import 'package:connectivity/connectivity.dart';

import '../connectivity.dart';

class ConnectivityInfoImpl implements ConnectivityInfo {
  StreamController<ConnectivityType> _connectivityTypeController =
      StreamController<ConnectivityType>();

  ConnectivityInfoImpl() {
    _subscribeToConnectivityChanges();
  }

  void _subscribeToConnectivityChanges() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) =>
        connectivityTypeController.add(_getConnectivityType(result)));
  }

  ConnectivityType _getConnectivityType(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityType.mobile;
      case ConnectivityResult.wifi:
        return ConnectivityType.wifi;
      case ConnectivityResult.none:
        return ConnectivityType.offline;
      default:
        return ConnectivityType.offline;
    }
  }

  @override
  Future<ConnectivityType> get networkType {
    return Connectivity().checkConnectivity().then<ConnectivityType>(
        (ConnectivityResult result) => _getConnectivityType(result));
  }

  @override
  Future<bool> get isConnected {
    return networkType.then<bool>((ConnectivityType connectivityType) =>
        connectivityType != ConnectivityType.offline);
  }

  @override
  StreamController<ConnectivityType> get connectivityTypeController =>
      _connectivityTypeController;

  @override
  Future<void> dispose() async {
    await _connectivityTypeController.close();
  }
}
