import 'dart:io';
import 'dart:async';

import 'package:connectivity/connectivity.dart';

class ConnectivityBloc {
  ConnectivityResult connectionStatus;

  StreamController<ConnectivityResult> _streamController =
      StreamController<ConnectivityResult>.broadcast();

  Stream<ConnectivityResult> get stream => _streamController.stream;

  ConnectivityBloc() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.mobile:
          connectionStatus = ConnectivityResult.mobile;
          _streamController.sink.add(connectionStatus);
          break;
        case ConnectivityResult.wifi:
          connectionStatus = ConnectivityResult.wifi;
          _streamController.sink.add(connectionStatus);
          break;
        case ConnectivityResult.none:
          connectionStatus = ConnectivityResult.none;
          _streamController.sink.add(connectionStatus);
          break;
      }
    });
  }

  void appLaunchConnectionCheck() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.mobile) {
          connectionStatus = ConnectivityResult.mobile;
          _streamController.sink.add(connectionStatus);
        } else if (connectivityResult == ConnectivityResult.wifi) {
          connectionStatus = ConnectivityResult.wifi;
          _streamController.sink.add(connectionStatus);
        }
      } else {
        connectionStatus = ConnectivityResult.none;
        _streamController.sink.add(connectionStatus);
      }
    } on SocketException catch (_) {
      connectionStatus = ConnectivityResult.none;
      _streamController.sink.add(connectionStatus);
    }
  }

  void dispose() {
    _streamController.close();
  }
}
