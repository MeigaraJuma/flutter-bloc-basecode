import 'package:flutter/material.dart';
import 'package:flutter_bloc_basecode/app_module/login/bloc/login_bloc.dart';
import 'package:flutter_bloc_basecode/app_module/login/screen/login_screen.dart';
import 'package:flutter_bloc_basecode/app_src/resources/util/app_screen_util.dart';
import 'package:provider/provider.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppScreenUtil().setScreenAwareConstant(context);
    return Provider(
        create: (_) => LoginBloc(),
        dispose: (_, LoginBloc bloc) => bloc.dispose(),
        child: LoginScreen());
  }
}
