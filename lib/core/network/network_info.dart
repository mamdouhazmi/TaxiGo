import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:taxigo/main.dart';

// For checking internet connectivity
abstract class NetworkInfoI {
  Future<bool> isConnected();
  Future<List<ConnectivityResult>> get connectivityResult;
  Stream<List<ConnectivityResult>> get onConnectivityChanged;
}

class NetworkInfo implements NetworkInfoI {
  Connectivity connectivity;

  static final NetworkInfo _networkInfo = NetworkInfo._internal(Connectivity());

  factory NetworkInfo() {
    return _networkInfo;
  }

  NetworkInfo._internal(this.connectivity) {
    connectivity = this.connectivity;
  }

  // Checks internet is connected or not
  @override
  Future<bool> isConnected() async {
    final result = await connectivityResult;
    return result.contains(ConnectivityResult.none);
  }

  // To check type of internet connectivity
  @override
  Future<List<ConnectivityResult>> get connectivityResult async {
    return connectivity.checkConnectivity();
  }

  // Check the type on internet connection on changed of internet connection
  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      connectivity.onConnectivityChanged;

  abstract class Failure {}

  // General failures
  class ServerFailure extends Failure {}
  class CacheFailure extends Failure {}
  class NetworkFailure extends Failure {}

  class ServerException implements Exception {}
  class CacheException implements Exception {}
  class NetworkException implements Exception {}

  // Can be used for throwing [NoInternetException]
  class NoInternetException implements Exception {
    late String _message;

    NoInternetException([String message = 'NoInternetException Occurred']) {
      if (globalMessengerKey.currentState != null) {
        globalMessengerKey.currentState!
            .showSnackBar(SnackBar(content: Text(message)));
      }
      this._message = message;
    }

    @override
    String toString() {
      return _message;
    }
  }
}
