import 'dart:ui';
import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color blanco = Color(0xffffffff);

  static const Color transparente = Color(0xffffff);

  static const Color negro = Color(0xff000000);

  static const Color rojo = Color(0xFFFF0000);

  static const Color azul = Color(0xFF006BFF);

  static const Color grisdesactivado = Color(0xff626262);

  static const principal = LinearGradient(
      begin: Alignment(1.00, 0.00),
      end: Alignment(-1, 0),
      colors: [Color(0xff006bff), Color(0xff2d83fa)]);

  static const Color cuestionario = Color(0x993c3c43);

  static const widgetanalitica =
      LinearGradient(colors: [Color(0xffffffff), Color(0xffbbe4ee)]);

  static const bajo =
      LinearGradient(colors: [Color(0xffffd400), Color(0xffd5ff06)]);

  static const alto =
      LinearGradient(colors: [Color(0xffff0000), Color(0xffad2500)]);

  static const Color gris = Color(0xfff4f4f4);

  static const Color gris3 = Color(0xffbabdc2);

  static const Color green = Color(0xff25cc25);

  static const Color bordes = Color(0x1e000000);

  static const blancodegradado = LinearGradient(colors: [
    Color(0xffffffff),
    Color(0xffffffff),
    Color(0xffffffff),
    Color(0xffffffff),
    Color(0xffffffff)
  ]);

  static const Color naranjagrafica = Color(0xffff955a);
}

abstract class AppTextStyles {
  static const TextStyle kiboStart = TextStyle(
    fontSize: 82,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: AppColors.blanco,
    height: 0.01,
  );

  static const TextStyle tituloL = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.45,
    letterSpacing: -0.07,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static const TextStyle tituloXL = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    height: 1.23,
    letterSpacing: -0.08,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static const TextStyle tituloXXL = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w400,
    height: 1,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static const TextStyle botonM2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.5,
    letterSpacing: -0.05,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static const TextStyle botonM1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static const TextStyle capsHeading = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    height: 1.6,
    letterSpacing: 0.05,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static const TextStyle paragraph = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.14,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );

  static const TextStyle calendario = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 2,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );
}

abstract class AppEffectStyles {
  static const BoxShadow elevadoEffect0 = BoxShadow(
    color: Color(0xcccbd6ff),
    offset: Offset(0, 10),
    blurRadius: 20,
    spreadRadius: 0,
  );
}
