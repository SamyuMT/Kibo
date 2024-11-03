import 'package:kibo/app/controllers/navbar_controller.dart';
import 'package:kibo/app/ui/pages/home/ajuste_alarma_page.dart';
import 'package:kibo/app/ui/pages/home/analitica_pages.dart';
import 'package:kibo/app/ui/pages/home/home_pages.dart';
import 'package:kibo/app/ui/pages/home/user_page.dart';
import 'package:kibo/app/ui/pages/home/ajuste_user_page.dart';
import 'package:kibo/app/ui/utils/style_utils.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart'; // Añadir GetX

class NavbarPage extends StatefulWidget {
  const NavbarPage({super.key});

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<NavbarPage> {
  int selectedIndex = 0; // Inicialmente en la opción Métricas

  // Instancias únicas de las páginas
  final List<Widget> screens = [
    const HomePage(),
    const AnaliticaPage(),
    const AjusteAlarmaPage(),
    const UserPage(),
    const AjusteUserPage(),
  ];

  final NavbarController _controller = Get.put(NavbarController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ArribaAppBar(
          controller: _controller,
          onUserTap: () {
            setState(() {
              selectedIndex = 3; // Cambia al índice de 'Ajustes User'
            });
          },
          onSettingsTap: () {
            setState(() {
              selectedIndex = 4; // Cambia al índice de 'Ajustes'
            });
          },
          conditional: selectedIndex,
        ), // Añadido
        body: IndexedStack(
          index: selectedIndex,
          children: screens,
        ),
        bottomNavigationBar: CustomNavigationBar(
          items: [
            //CustomNavigationBarItem(
            //icon: SvgPicture.asset('assets/images/Noticias.svg',
            //  color: selectedIndex == 0 ? AppColors.azul : AppColors.negro),
            //),
            //CustomNavigationBarItem(
            //icon: SvgPicture.asset('assets/images/Reportes.svg',
            //  color: selectedIndex == 1 ? AppColors.azul : AppColors.negro),
            //),
            CustomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/HomeP.svg',
                  color: selectedIndex == 0 ? AppColors.azul : AppColors.negro),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/Metricas.svg',
                  color: selectedIndex == 1 ? AppColors.azul : AppColors.negro),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/ajutesAlarma.svg',
                  color: selectedIndex == 2 ? AppColors.azul : AppColors.negro),
            ),
          ],
          onTap: (index) => setState(() => selectedIndex = index),
          backgroundColor: AppColors.blanco,
          iconSize: 32.0,
        ),
      ),
    );
  }
}

class ArribaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final NavbarController controller;
  final VoidCallback onUserTap; // Callback para el botón User
  final VoidCallback onSettingsTap; // Callback para el botón Ajustes
  final int conditional; // Añadido

  const ArribaAppBar({
    super.key,
    required this.controller,
    required this.onUserTap,
    required this.onSettingsTap,
    required this.conditional,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.blanco,
      elevation: 0,
      // Sin sombra
      centerTitle: true,
      title: const KiboText(),
      // El logo de KIBO en el centro
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
        ),
        // Ajuste del padding
        child: User(
            controller: controller,
            activate: conditional == 3,
            onTap: onUserTap),
      ),
      // Botón de usuario a la izquierda
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0), // Ajuste del padding
          child: AjustesUser(
              controller: controller,
              activate: conditional == 4,
              onTap: onSettingsTap),
        ),
      ], // Botón de ajustes a la derecha
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class User extends StatelessWidget {
  final NavbarController controller;
  final bool activate;
  final VoidCallback onTap; // Callback para el tap

  const User(
      {super.key,
      required this.controller,
      required this.activate,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 56, maxHeight: 56),
          child: IconButton(
            onPressed: onTap,
            // Llama al callback
            icon: SvgPicture.asset(
              'assets/images/Union.svg',
              width: 37,
              height: 37,
              color: activate ? AppColors.azul : AppColors.negro,
            ),
            iconSize: 37,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
        Container(
          constraints: const BoxConstraints(maxHeight: 8, maxWidth: 8),
          decoration: BoxDecoration(
            color: activate ? AppColors.azul : AppColors.transparente,
            shape: BoxShape.circle,
          ),
        )
      ],
    );
  }
}

class AjustesUser extends StatelessWidget {
  final NavbarController controller;
  final bool activate;
  final VoidCallback onTap; // Callback para el tap

  const AjustesUser(
      {super.key,
      required this.controller,
      required this.activate,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 56, maxHeight: 56),
          child: IconButton(
            onPressed: onTap,
            // Llama al callback
            icon: SvgPicture.asset(
              'assets/images/AjustesUnion.svg',
              width: 37,
              height: 37,
              color: activate ? AppColors.azul : AppColors.negro,
            ),
            iconSize: 37,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
        Container(
          constraints: const BoxConstraints(maxHeight: 8, maxWidth: 8),
          decoration: BoxDecoration(
            color: activate ? AppColors.azul : AppColors.transparente,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}

class KiboText extends StatelessWidget {
  const KiboText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 58, maxWidth: 140),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'K',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.negro,
              fontSize: 49,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0.01,
            ),
          ),
          Text(
            'I',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.negro,
              fontSize: 49,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0.01,
            ),
          ),
          Text(
            'B',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.negro,
              fontSize: 49,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0.01,
            ),
          ),
          Text(
            'O',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.negro,
              fontSize: 49,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0.01,
            ),
          ),
        ],
      ),
    );
  }
}
