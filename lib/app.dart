import 'package:app_ui/core/constants/colors.dart';
import 'package:app_ui/presentation/routers/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
        title: 'APP',
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fade,
        theme: ThemeData(primaryColor: AppColor.primaryColor),
        initialRoute: AppRoutes.Onboarding,
        getPages: pages,
        initialBinding: AppBinding(),
        smartManagement: SmartManagement.keepFactory,
        locale: Get.deviceLocale,
        builder: EasyLoading.init(
          builder: (context, widget) {
            return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: Navigator(
                  onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (context) => Container(
                      child: widget!,
                    ),
                  ),
                ));
          },
        ));
  }
}
