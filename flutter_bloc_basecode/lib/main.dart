import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_module/routes.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:
      SystemUiOverlayStyle.dark.systemNavigationBarColor));

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((void value) {
    Routes();
  });

}