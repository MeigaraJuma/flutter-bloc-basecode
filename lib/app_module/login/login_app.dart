import 'package:flutter/material.dart';
import 'package:flutter_bloc_basecode/app_module/login/bloc/login_bloc.dart';
import 'package:flutter_bloc_basecode/app_module/login/screen/login_screen.dart';
import 'package:flutter_bloc_basecode/app_src/resources/util/app_screen_util.dart';
import 'package:provider/provider.dart';

import 'bloc/login_bloc.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppScreenUtil().setScreenAwareConstant(context);
    return Provider<LoginBloc>(
        create: (_) => LoginBloc(),
        dispose: (_, LoginBloc bloc) => bloc.dispose(),
        child: Scaffold(body: LoginScreen()));
  }
}
