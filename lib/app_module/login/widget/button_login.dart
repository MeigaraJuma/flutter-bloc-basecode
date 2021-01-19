import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;

import '../../../app_src/model/response_message_model.dart';
import '../../../app_src/resources/util/app_colors.dart';
import '../../../app_src/resources/util/app_screen_util.dart';
import '../../../app_src/widgets/custom_toast.dart';
import '../bloc/login_bloc.dart';

class ButtonLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const Duration animDuration = Duration(milliseconds: 250);
    final BorderRadius borderRadius = BorderRadius.circular(AppScreenUtil.s350);
    final LoginBloc bloc = Provider.of<LoginBloc>(context);

    return StreamBuilder<bool>(
        stream: bloc.submitValidInput,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          final bool checkValid = snapshot.hasData && snapshot.data;

          return AnimatedContainer(
              duration: animDuration,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: checkValid
                      ? AppColors.deepTealColor
                      : Colors.grey[300],
                  borderRadius: borderRadius,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(-7, 15),
                        blurRadius: 6,
                        spreadRadius: 0)
                  ]),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: !checkValid
                        ? null
                        : () async {
                            final ResponseMessageModel response =
                                await bloc.submitLogin();
                            CustomToast.showToast(response.message);
                          },
                    borderRadius: borderRadius,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: AppScreenUtil.s56),
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                            duration: animDuration,
                            child: const Text('Login'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: checkValid
                                    ? Colors.white
                                    : Colors.grey[400],
                                fontSize: FontSize.f70,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal)),
                      ),
                    )),
              ));
        });
  }
}
