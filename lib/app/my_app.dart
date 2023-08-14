import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:template/core/enums/connectivity_status.dart';
import 'package:template/core/translation/app_translation.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:template/ui/views/login_view/login_view.dart';

import '../core/utilis/general_util.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
        initialData: ConnectivityStatus.ONLINE,
        create: (context) =>
            connectivityService.connectivityStatusController.stream,
        child: GetMaterialApp(
            defaultTransition: Transition.circularReveal,
            transitionDuration: const Duration(milliseconds: 12),
            title: 'Flutter Demo',
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            locale: getLocale(),
            fallbackLocale: getLocale(),
            translations: AppTranslation(), //1. call BotToastInit
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Alexandria-Regular',
              primarySwatch: Colors.blue,
            ),
            home: const LoginView()));
  }
}

Locale getLocale() {
  if (storage.getAppLanguage() == 'ar') {
    return const Locale('ar', 'SA');
  } else if (storage.getAppLanguage() == 'en') {
    return const Locale('en', 'US');
  } else {
    return const Locale('tr', 'TR');
  }
}
