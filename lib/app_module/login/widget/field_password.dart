import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;

import '../../../app_src/resources/util/app_screen_util.dart';
import '../bloc/login_bloc.dart';

class FieldPassword extends StatelessWidget {
  const FieldPassword(
      {this.hintStyle,
        this.borderLine,
        this.focusNode,
        this.errorStyle,
        this.contentPadding,
        this.textStyle,
        this.errorBorderLine});

  final TextStyle textStyle, hintStyle, errorStyle;
  final OutlineInputBorder borderLine, errorBorderLine;
  final FocusNode focusNode;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = Provider.of<LoginBloc>(context, listen: false);

    return StreamBuilder<String>(
        stream: loginBloc.password,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return StreamBuilder<bool>(
              stream: loginBloc.showPass,
              initialData: true,
              builder:
                  (BuildContext context, AsyncSnapshot<bool> showPassSnapshot) {
                return TextField(
                    obscureText: showPassSnapshot.data,
                    style: textStyle,
                    onChanged: loginBloc.passListener,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      contentPadding: contentPadding,
                      hintText: 'Password',
                      hintStyle: hintStyle,
                      disabledBorder: borderLine,
                      enabledBorder: borderLine,
                      focusedBorder: borderLine,
                      errorBorder: errorBorderLine,
                      focusedErrorBorder: errorBorderLine,
                      errorText:
                      snapshot.hasError ? snapshot.error.toString() : null,
                      errorStyle: errorStyle,
                      suffixIcon: IconButton(
                          icon: Icon(
                              showPassSnapshot.data
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: AppScreenUtil.s70),
                          onPressed: () =>
                              loginBloc.showPassListener(!showPassSnapshot.data),
                          color: const Color(0xff707070)),
                    ));
              });
        });
  }
}
