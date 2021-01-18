import 'package:dio/dio.dart';

import '../../../app_src/model/json_return_error_model.dart';
import '../../../app_src/resources/connection/network_connection.dart';
import '../../../app_src/resources/util/app_string.dart';
import '../model/login_response_model.dart';

class LoginApiProvider with NetworkConnection {
  LoginApiProvider(this._indexList, this._valueList);

  final List<String> _indexList;
  final List<dynamic> _valueList;

  Future<LoginResponseModel> loginMember() async {
    Response<dynamic> response;
    try {
      response = await getJSON('${AppString.baseUrl}/api/auth/login',
          'POST', _indexList, _valueList, '');
      return LoginResponseModel.fromJson(response.data as Map<String, dynamic>);
    } on DioError catch (error) {
      if (error.response != null) {
        final JsonReturnErrorModel jsonResponse = JsonReturnErrorModel.fromJson(error.response.data as Map<String, dynamic>);
        return LoginResponseModel.withError(jsonResponse.message);
      } else {
        return LoginResponseModel.withError(handleError(error));
      }
    }
  }
}