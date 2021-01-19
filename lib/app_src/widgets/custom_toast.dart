import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../resources/util/app_colors.dart';
import '../resources/util/app_screen_util.dart';

class CustomToast {
  static void showToast(String message, {Color bgColor = Colors.red}) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: bgColor,
        textColor: AppColors.whiteColor,
        fontSize: FontSize.f42);
  }
}
