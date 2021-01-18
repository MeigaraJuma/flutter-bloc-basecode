import 'package:dio/dio.dart';

import '../connection/network_connection.dart';
import '../util/app_string.dart';

class ConnectionApiProvider with NetworkConnection {
  ConnectionApiProvider(this._auth);

  final String _auth;

  Future<bool> logoutMember() async {
    try {
      await getJSON('${AppString.baseUrl}auth/logout', 'POST', <String>[],
          <String>[], _auth);
      return true;
    } on DioError catch (_) {
      return false;
    }
  }
}
