import 'package:kibo/app/ui/pages/Registrarse/Registrarse_pages.dart';
import 'package:kibo/app/ui/pages/Registrarse/registar_info_pages.dart';
import 'package:kibo/app/ui/pages/home/ajuste_alarma_page.dart';
import 'package:kibo/app/ui/pages/home/analitica_pages.dart';
import 'package:kibo/app/ui/pages/home/home_pages.dart';
import 'package:kibo/app/ui/pages/home/user_page.dart';
import 'package:kibo/app/ui/pages/login/login_pages.dart';
import 'package:kibo/app/ui/pages/loginOrRegister_pages.dart';
import 'package:kibo/app/ui/pages/navbar.dart';
import 'package:kibo/app/ui/pages/start01_pages.dart';
import 'package:get/get.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.STARTONE,
      page: () => Start01Page(),
    ),
    GetPage(
      name: Routes.LOGINREGISTER,
      page: () => LoginorregisterPages(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.ANALITICA,
      page: () => AnaliticaPage(),
    ),
    GetPage(name: Routes.NAVBAR, page: () => NavbarPage()),
    GetPage(
      name: Routes.AJUSTEALARMA,
      page: () => AjusteAlarmaPage(),
    ),
    GetPage(
      name: Routes.USER,
      page: () => UserPage(),
    ),
    GetPage(
      name: Routes.AJUSTEUSER,
      page: () => AjusteAlarmaPage(),
    ),
    GetPage(
      name: Routes.REGISTRARSE,
      page: () => RegistrarsePages(),
    ),
    GetPage(
      name: Routes.REGISTRARSEINFO,
      page: () => RegistarInfoPages(),
    ),

  ];
}
