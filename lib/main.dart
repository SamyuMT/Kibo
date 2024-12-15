import 'package:kibo/app/bindlings/login_bindling.dart';
import 'package:kibo/app/controllers/ajuste_alarma_controller.dart';
import 'package:kibo/app/controllers/ajustes_user_controller.dart';
import 'package:kibo/app/controllers/user_controller.dart';
import 'package:kibo/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'app/controllers/analitica_controller.dart';
import 'app/controllers/home_controller.dart';
import 'app/ui/themes/light_theme.dart';

void main() async {
  Get.put(AjusteAlarmaController());
  Get.put(AnaliticaController());
  Get.put(HomeController());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    theme: appThemeData,
    defaultTransition: Transition.fade,
    initialBinding: LoginBindling(),
    getPages: AppPages.pages,
    builder: (context, widget) {
      widget = EasyLoading.init()(context, widget);
      return widget;
    },
  ));
}
