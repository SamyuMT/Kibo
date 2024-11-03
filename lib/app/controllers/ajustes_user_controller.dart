import 'package:kibo/app/routes/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AjustesUserController extends GetxController {
  get formKeyAnalitica => GlobalKey<FormState>();

  // Observable variables
  var generoText = 'Masculino'.obs;
  var tipoDocumentoText = 'CC'.obs;
  var departamentoText = 'Valle del Cauca'.obs;
  var municipioOCiudadText = 'Yumbo'.obs;
  var barrioText = 'Uribe'.obs;
  var tipoDeCalleText = 'Calle'.obs;
  var calleText = 'Cl 7'.obs;
  var numeroText = '#10-62'.obs;
  var numeroDocumentoText = '1109184453'.obs;

  // Contacto de emergencia
  var nombreTextEmergencia = 'Lourdes de la Torre Acosta'.obs;
  var generoTextEmergencia = 'Femenino'.obs;
  var tipoDocumentoTextEmergencia = 'CC'.obs;
  var departamentoTextEmergencia = 'Valle del Cauca'.obs;
  var municipioOCiudadTextEmergencia = 'Yumbo'.obs;
  var barrioTextEmergencia = 'Uribe'.obs;
  var tipoDeCalleTextEmergencia = 'Calle'.obs;
  var calleTextEmergencia = 'Cl 7'.obs;
  var numeroTextEmergencia = '#10-62'.obs;
  var numeroDocumentoTextEmergencia = '31482638'.obs;
  var numeroCelularTextEmergencia = '3172908916'.obs;
  var parentescoEmergencia = 'Madre'.obs;

  // Información de Atención Médica
  var aseguradoraTextEmergencia = 'Sura'.obs;
  var tipoVinculacionTextEmergencia = 'Cotizante'.obs;
  var nombreMedicoTextEmergencia = 'Alberto Jimenez'.obs;
  var especialidadMedicoTextEmergencia = 'Cardiologo'.obs;
  var correoTextEmergencia = 'Alberto.jimenez@gmail.com'.obs;
  var hospitalResidenteTextEmergencia = 'Clinica la Esperanza'.obs;

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
