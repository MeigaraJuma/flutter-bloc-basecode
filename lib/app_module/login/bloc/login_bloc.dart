import 'package:rxdart/rxdart.dart';

import '../../../app_src/model/response_message_model.dart';
import '../../../app_src/resources/connection/shared_preferences_handler.dart';
import '../model/login_model.dart';
import '../model/login_response_model.dart';
import '../resources/login_api_provider.dart';
import 'login_validator.dart';

class LoginBloc with LoginValidator {
  final BehaviorSubject<String> _userName = BehaviorSubject<String>();
  final BehaviorSubject<String> _password = BehaviorSubject<String>();
  final BehaviorSubject<String> _role = BehaviorSubject<String>();
  final BehaviorSubject<bool> _showPass = BehaviorSubject<bool>();

  Stream<String> get userName => _userName.stream.transform(validateEmailHp);

  Stream<String> get password => _password.stream.transform(validatePass);

  Future<String> get lastUserName async {
    final SharedPreferencesHandler sp = SharedPreferencesHandler();
    return await sp.getLoginId();
  }

  String get role => _role.value;

  Stream<bool> get showPass => _showPass.stream;

  Stream<bool> get submitValidInput => Rx.combineLatest2(userName, password,
          (String userNameValue, String passwordValue) {
        if (userNameValue != null &&
            userNameValue != '' &&
            passwordValue != null &&
            passwordValue != '') {
          return true;
        }
        return false;
      });

  Function(String) get userNameListener => _userName.sink.add;

  Function(String) get passListener => _password.sink.add;

  Function(String) get roleListener => _role.sink.add;

  Function(bool) get showPassListener => _showPass.sink.add;


  Future<void> _setLocalStorage(LoginModel login, String loginId) async {
    final SharedPreferencesHandler sp = SharedPreferencesHandler();

    await sp.setAccessToken(login.accessToken);
    await sp.setExpireIn(login.expiresIn);
    await sp.setTokenType(login.tokenType);
    await sp.setLoginId(loginId);
  }

  Future<ResponseMessageModel> submitLogin() async {
    final String usernameValue = _userName.value;
    final String passwordValue = _password.value;

    final LoginResponseModel response = await LoginApiProvider(
        <String>['email', 'password'], <String>[usernameValue, passwordValue])
        .loginMember();

    if (response.error == '') {
      await _setLocalStorage(response.results, usernameValue);
      return ResponseMessageModel(result: true, message: 'Login Success!');
    } else {
      return ResponseMessageModel(result: false, message: response.error);
    }
  }

  bool submitValid() {
    final String emailHpVal = _userName.value;
    final String passwordVal = _password.value;
    bool isValid = true;
    if (emailHpVal == null) {
      _userName.sink.addError('Nomor HP atau email harus diisi');
      isValid = false;
    }

    if (passwordVal == null) {
      _password.sink.addError('Password harus diisi');
      isValid = false;
    }
    return isValid;
  }

  void dispose() {
    _userName.close();
    _password.close();
    _showPass.close();
  }
}