import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ConnectivityStatus { connected, disconnected }

class ConnectivityCubit extends Cubit<ConnectivityStatus> {
  final Connectivity _connectivity = Connectivity();
  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  ConnectivityCubit() : super(ConnectivityStatus.disconnected) {
    _subscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event.first == ConnectivityResult.none) {
        showGlobalSnackBar('no');
        emit(ConnectivityStatus.disconnected);
      } else {
        showGlobalSnackBar('yes');
        emit(ConnectivityStatus.connected);
      }
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void showGlobalSnackBar(String message) {
  final snackBar = SnackBar(
    content: Text(message),
  );

  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
}
