import 'login_model.dart';

class LoginResponseModel {
  LoginResponseModel.fromJson(Map<String, dynamic> parsedJson)
      : results = LoginModel.fromJson(parsedJson),
        error = '';

  LoginResponseModel.withError(this.error, {this.results});

  final LoginModel results;
  final String error;
}
