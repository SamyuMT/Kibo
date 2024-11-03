import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../routes/pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final box = GetStorage();

    bool isLongged = box.read('isLogged') ?? false;

    if (route != Routes.LOGIN) {
      return isLongged ? null : const RouteSettings(name: Routes.LOGIN);
    } else {
      return isLongged ? const RouteSettings(name: Routes.HOME) : null;
    }
  }
}
