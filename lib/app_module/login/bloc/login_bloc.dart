import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final BehaviorSubject<String> _userName = BehaviorSubject();
  final BehaviorSubject<String> _password = BehaviorSubject();

  Stream<String> get userName => _userName.stream;
  Stream<String> get password => _password.stream;

  Function(String) get userNameChanged => _userName.sink.add;
  Function(String) get passwordChanged => _password.sink.add;

  void dispose() {
    _userName.close();
    _password.close();
  }
}