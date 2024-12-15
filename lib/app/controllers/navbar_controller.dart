import 'package:get/get.dart';
import 'package:kibo/app/controllers/user_controller.dart';
import 'package:kibo/app/data/repository/navbar_repository.dart';

import 'ajuste_alarma_controller.dart';
import 'ajustes_user_controller.dart';




class NavbarController extends GetxController {

  NavbarRepository navbarRepository = NavbarRepository();


  @override
  onReady() async {
    Get.put(AjustesUserController());
    Get.put(UserController());
    super.onReady();
  }


}
