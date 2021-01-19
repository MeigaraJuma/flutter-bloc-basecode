import 'package:fluro/fluro.dart' show FluroRouter, Handler, TransitionType;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../app_src/resources/util/app_colors.dart';
import 'login/login_app.dart';

class Routes {
  Routes() {
    final FluroRouter router = FluroRouter();
    runApp(RefreshConfiguration(
      footerTriggerDistance: 15,
      dragSpeedRatio: 0.91,
      headerBuilder: () => BezierCircleHeader(bezierColor: AppColors.whiteColor),
      springDescription: const SpringDescription(stiffness: 170.0, damping: 16.0, mass: 1.9),
      enableBallisticLoad: true,
      enableLoadingWhenNoData: false,
      enableRefreshVibrate: false,
      enableLoadMoreVibrate: false,
      shouldFooterFollowWhenNotFull: (_) => false,
      child: MaterialApp(
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const <Locale>[
          Locale('en', 'US'), // English
          Locale('in', 'ID') // Indonesia
        ],
        title: 'Flutter Base Bloc',
        home: LoginApp(),
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.generator,
        theme: ThemeData(primaryColor: AppColors.whiteColor),
      ),
    ));
  }

// ================ R O U T E S ================
  void routesInit(FluroRouter router) {
    router.define('/login',
        handler: loginHandler, transitionType: TransitionType.fadeIn);
  }

// ================ H A N D L E R ================
  Handler loginHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          LoginApp());
}
