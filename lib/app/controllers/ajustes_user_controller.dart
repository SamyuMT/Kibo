import 'package:get_storage/get_storage.dart';
import 'package:kibo/app/routes/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AjustesUserController extends GetxController {
  get formKeyAnalitica => GlobalKey<FormState>();

  void onReady() {
    final box = GetStorage();
    generoText.value = box.read('user_gender');
    tipoDocumentoText.value = box.read('user_type_doc');
    departamentoText.value = box.read('user_departament');
    municipioOCiudadText.value = box.read('user_city');
    barrioText.value = box.read('user_neighborhood');
    tipoDeCalleText.value = box.read('user_type_street');
    calleText.value = box.read('user_street_number');
    numeroText.value = box.read('user_house_number');
    numeroDocumentoText.value = box.read('user_doc_number');


    nombreTextEmergencia.value = box.read('emergency_name');
    apellidoTextEmergencia.value = box.read('emergency_last_name');
    generoTextEmergencia.value = box.read('emergency_gender');
    tipoDocumentoTextEmergencia.value = box.read('emergency_type_doc');
    departamentoTextEmergencia.value = box.read('emergency_departament');
    municipioOCiudadTextEmergencia.value = box.read('emergency_city');
    barrioTextEmergencia.value = box.read('emergency_neighborhood');
    tipoDeCalleTextEmergencia.value = box.read('emergency_type_street');
    calleTextEmergencia.value = box.read('emergency_street_number');
    numeroTextEmergencia.value = box.read('emergency_house_number');
    numeroDocumentoTextEmergencia.value = box.read('emergency_doc_number');
    numeroCelularTextEmergencia.value = box.read('emergency_cel_mobile');
    parentescoEmergencia.value = box.read('emergency_relationship');

    aseguradoraTextEmergencia.value = box.read('medical_insurance');
    tipoVinculacionTextEmergencia.value = box.read('medical_type_link');
    nombreMedicoTextEmergencia.value = box.read('doctor_name');
    apellidoMedicoTextEmergencia.value = box.read('doctor_last_name');

    especialidadMedicoTextEmergencia.value = box.read('doctor_specialty');
    correoTextEmergencia.value = box.read('doctor_email');
    hospitalResidenteTextEmergencia.value = box.read('doctor_institution');

    update(); // Notifica los cambios
    super.onReady();
  }

  // Observable variables
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
  var aseguradoraTextEmergencia = 'Sura'.obs;
  var tipoVinculacionTextEmergencia = 'Cotizante'.obs;
  var nombreMedicoTextEmergencia = 'Alberto Jimenez'.obs;
  var apellidoMedicoTextEmergencia = ''.obs;

  var especialidadMedicoTextEmergencia = 'Cardiologo'.obs;
  var correoTextEmergencia = 'Alberto.jimenez@gmail.com'.obs;
  var hospitalResidenteTextEmergencia = 'Clinica la Esperanza'.obs;
  var aseguradoraTextEmergencia1 = 'Sura'.obs;

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
}
