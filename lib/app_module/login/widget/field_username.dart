import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;

import '../bloc/login_bloc.dart';

class FieldUsername extends StatelessWidget {
  const FieldUsername(
      {this.textStyle,
      this.hintStyle,
      this.errorStyle,
      this.borderLine,
      this.errorBorderLine,
      this.passFocus,
      this.contentPadding});

  final TextStyle textStyle, hintStyle, errorStyle;
  final OutlineInputBorder borderLine, errorBorderLine;
  final FocusNode passFocus;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller;
    final LoginBloc loginBloc = Provider.of<LoginBloc>(context, listen: false);

    Future<void> _getLastUserName() async {
      final String lastUserName = await loginBloc.lastUserName;

      if (lastUserName != null || lastUserName != '') {
        loginBloc.userNameListener(lastUserName);
        _controller = TextEditingController(text: lastUserName);
        FocusScope.of(context).requestFocus(passFocus);
      }
    }

    _getLastUserName();

    return StreamBuilder<String>(
      stream: loginBloc.userName,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) =>
          TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _controller,
              textInputAction: TextInputAction.next,
              style: textStyle,
              onChanged: loginBloc.userNameListener,
              onSubmitted: (_) {
                FocusScope.of(context).unfocus();
                FocusScope.of(context).requestFocus(passFocus);
              },
              decoration: InputDecoration(
                  contentPadding: contentPadding,
                  hintText: 'No. HP atau email',
                  errorText:
                      snapshot.hasError ? snapshot.error.toString() : null,
                  errorStyle: errorStyle,
                  hintStyle: hintStyle,
                  disabledBorder: borderLine,
                  enabledBorder: borderLine,
                  errorBorder: errorBorderLine,
                  focusedErrorBorder: errorBorderLine,
                  focusedBorder: borderLine)),
    );
  }
}
