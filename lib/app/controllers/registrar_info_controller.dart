import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/pages.dart';

class RegistrarInfoController extends GetxController {
  get formKeyRegistrarseInfo => null;


  void backLoginRegister() {
    clear();
    Get.toNamed(Routes.LOGINREGISTER);
  }

  // Observable variables
  var nombreText = ''.obs;
  var apellidoText = ''.obs;

  var generoText = ''.obs;
  var tipoDocumentoText = ''.obs;
  var departamentoText = ''.obs;
  var municipioOCiudadText = ''.obs;
  var barrioText = ''.obs;
  var tipoDeCalleText = ''.obs;
  var calleText = ''.obs;
  var numeroText = ''.obs;
  var numeroDocumentoText = ''.obs;

  // Contacto de emergencia
  var nombreTextEmergencia = ''.obs;
  var apellidoTextEmergencia = ''.obs;
  var generoTextEmergencia = ''.obs;
  var tipoDocumentoTextEmergencia = ''.obs;
  var departamentoTextEmergencia = ''.obs;
  var municipioOCiudadTextEmergencia = ''.obs;
  var barrioTextEmergencia = ''.obs;
  var tipoDeCalleTextEmergencia = ''.obs;
  var calleTextEmergencia = ''.obs;
  var numeroTextEmergencia = ''.obs;
  var numeroDocumentoTextEmergencia = ''.obs;
  var numeroCelularTextEmergencia = ''.obs;
  var parentescoEmergencia = ''.obs;

  // Información de Atención Médica
  var aseguradoraTextEmergencia = ''.obs;
  var tipoVinculacionTextEmergencia = ''.obs;
  var nombreMedicoTextEmergencia = ''.obs;
  var especialidadMedicoTextEmergencia = ''.obs;
  var correoTextEmergencia = ''.obs;
  var hospitalResidenteTextEmergencia = ''.obs;


  List<String> generosList = ['Masculino', 'Femenino', 'Ninguno'];
  List<String> tipoVinculacion = ['Cotizante', 'Beneficiario'];
  List<String> tipoDeDocumentos = ['TI', 'CC', 'TE', 'CE', 'NIT', 'PAS'];
  List<String> departamentosColombia = [
    'Amazonas',
    'Antioquia',
    'Arauca',
    'Atlántico',
    'Bolívar',
    'Boyacá',
    'Caldas',
    'Caquetá',
    'Casanare',
    'Cauca',
    'Cesar',
    'Chocó',
    'Córdoba',
    'Cundinamarca',
    'Guainía',
    'Guaviare',
    'Huila',
    'La Guajira',
    'Magdalena',
    'Meta',
    'Nariño',
    'Norte de Santander',
    'Putumayo',
    'Quindío',
    'Risaralda',
    'San Andrés, Providencia y Santa Catalina',
    'Santander',
    'Sucre',
    'Tolima',
    'Valle del Cauca',
    'Vaupés',
    'Vichada'
  ];

  List<String> tiposDeVias = [
    'Calle',
    'Carrera',
    'Avenida',
    'Diagonal',
    'Transversal',
    'Circular',
    'Autopista',
    'Camino',
    'Carretera',
    'Paseo',
    'Vía',
    'Bulevar',
    'Pasaje',
    'Peatonal',
    'Kilómetro'
  ];

  List<String> parentescos = [
    'Padre',
    'Madre',
    'Hijo',
    'Hija',
    'Hermano',
    'Hermana',
    'Abuelo',
    'Abuela',
    'Nieto',
    'Nieta',
    'Tío',
    'Tía',
    'Sobrino',
    'Sobrina',
    'Primo',
    'Prima',
    'Cuñado',
    'Cuñada',
    'Suegro',
    'Suegra',
    'Yerno',
    'Nuera',
    'Padrastro',
    'Madrastra',
    'Hijastro',
    'Hijastra',
    'Padrino',
    'Madrina',
    'Ahijado',
    'Ahijada',
    'Amigo',
    'Otro'
  ];
  List<String> aseguradoraList = ['Sura', 'AsmetSalud'];

  void guardarDatos() {
    String locationMessage = 'Datos guardados:\n'
        'Género: $generoText\n'
        'Tipo de Documento: $tipoDocumentoText\n'
        'Departamento: $departamentoText\n'
        'Municipio: $municipioOCiudadText\n'
        'Barrio: $barrioText\n'
        'Tipo de Calle: $tipoDeCalleText\n'
        'Calle: $calleText\n'
        'Número: $numeroText\n';
    // Imprimir el mensaje en la consola
    EasyLoading.showInfo(locationMessage,
        duration: const Duration(milliseconds: 6000));
  }

  void clear() {
    // Datos principales
    generoText.value = '';
    tipoDocumentoText.value = '';
    departamentoText.value = '';
    municipioOCiudadText.value = '';
    barrioText.value = '';
    tipoDeCalleText.value = '';
    calleText.value = '';
    numeroText.value = '';
    numeroDocumentoText.value = '';

    // Contacto de emergencia
    nombreTextEmergencia.value = '';
    generoTextEmergencia.value = '';
    tipoDocumentoTextEmergencia.value = '';
    departamentoTextEmergencia.value = '';
    municipioOCiudadTextEmergencia.value = '';
    barrioTextEmergencia.value = '';
    tipoDeCalleTextEmergencia.value = '';
    calleTextEmergencia.value = '';
    numeroTextEmergencia.value = '';
    numeroDocumentoTextEmergencia.value = '';
    numeroCelularTextEmergencia.value = '';
    parentescoEmergencia.value = '';

    // Información de Atención Médica
    aseguradoraTextEmergencia.value = '';
    tipoVinculacionTextEmergencia.value = '';
    nombreMedicoTextEmergencia.value = '';
    especialidadMedicoTextEmergencia.value = '';
    correoTextEmergencia.value = '';
    hospitalResidenteTextEmergencia.value = '';
  }
}