import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_src/resources/util/app_screen_util.dart';
import '../bloc/login_bloc.dart';
import '../widget/button_login.dart';
import '../widget/field_password.dart';
import '../widget/field_username.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({this.radius, this.screenWidth});

  final double radius, screenWidth;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc loginBloc;
  FocusNode passFocus, loginFocus;

  @override
  void initState() {
    super.initState();
    passFocus = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loginBloc = Provider.of<LoginBloc>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle hintStyle = TextStyle(
        color: const Color(0xffcbcbcb),
        fontSize: FontSize.f42,
        fontWeight: FontWeight.w300);
    final TextStyle textStyle = TextStyle(
        color: const Color(0xff707070),
        fontSize: FontSize.f49,
        fontWeight: FontWeight.w500);
    final TextStyle errorStyle = TextStyle(
        fontSize: FontSize.f42);
    final OutlineInputBorder borderLine = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.radius),
      borderSide: const BorderSide(color: Color(0xffcbcbcb)),
    );
    final OutlineInputBorder errorBorderLine = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.radius),
      borderSide: const BorderSide(color: Colors.red),
    );
    final EdgeInsets borderTextPadding =
    EdgeInsets.only(left: AppScreenUtil.s35);

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: AppScreenUtil.s21),
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    FieldUsername(
                        borderLine: borderLine,
                        contentPadding: borderTextPadding,
                        errorBorderLine: errorBorderLine,
                        errorStyle: errorStyle,
                        hintStyle: hintStyle,
                        textStyle: textStyle),
                    SizedBox(height: AppScreenUtil.s35),
                    FieldPassword(
                        errorBorderLine: errorBorderLine,
                        contentPadding: borderTextPadding,
                        focusNode: passFocus,
                        errorStyle: errorStyle,
                        textStyle: textStyle,
                        borderLine: borderLine,
                        hintStyle: hintStyle),
                    SizedBox(height: AppScreenUtil.s91),
                    InkWell(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, 'resetPassword'),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(child: const Text('Lupa Password')),
                          ]),
                    ),
                    SizedBox(height: AppScreenUtil.s91),
                    ButtonLogin()
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: AppScreenUtil.s7),
        ],
      ),
    );
  }

  @override
  void dispose() {
    loginBloc.dispose();
    super.dispose();
  }
}
