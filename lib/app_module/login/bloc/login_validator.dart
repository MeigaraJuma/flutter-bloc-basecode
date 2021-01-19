import 'dart:async' show EventSink, StreamTransformer;

class LoginValidator {
  final StreamTransformer<String, String> validateEmailHp =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (String emailAndHp, EventSink<String> sink) {
    final RegExp regExp = RegExp(
        r'^(?:\d{10,16}|[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)$');

    if (emailAndHp != null && emailAndHp != '') {
      if (regExp.hasMatch(emailAndHp)) {
        sink.add(emailAndHp);
      } else {
        sink.add('');
        sink.addError('Username hanya menerima format No.HP atau email');
      }
    } else {
      sink.add('');
      sink.addError('Username tidak boleh kosong');
    }
  });

  final StreamTransformer<String, String> validatePass =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (String pass, EventSink<String> sink) {
    if (pass != null && pass != '') {
      if (pass.length >= 8) {
        sink.add(pass);
      } else {
        sink.add('');
        sink.addError('Panjang Password minimum 8 karakter');
      }
    } else {
      sink.add('');
      sink.addError('Password tidak boleh kosong');
    }
  });
}
