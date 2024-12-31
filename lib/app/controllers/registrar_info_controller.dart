import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kibo/app/data/model/doctor_user/doctor_user.dart';
import 'package:kibo/app/data/model/doctor_user/doctor_user_data.dart';
import 'package:kibo/app/data/model/emergency_user/emergency_user_data.dart';
import 'package:kibo/app/data/model/info_user/info_user_data.dart';
import 'package:kibo/app/data/model/medical_user/medical_user_data.dart';
import 'package:kibo/app/data/model/user/user_data.dart';


import '../data/model/credential/credential.dart';
import '../data/model/credential/credential_data.dart';
import '../data/model/medical_user/medical_user.dart';
import '../data/repository/login_repository.dart';
import '../data/repository/navbar_repository.dart';
import '../routes/pages.dart';

class RegistrarInfoController extends GetxController {
  get formKeyRegistrarseInfo => null;
  NavbarRepository navbarRepository = NavbarRepository();


  void backLoginRegister() {
    clear();
    Get.toNamed(Routes.LOGINREGISTER);
  }

  // Observable variables
  var nombreText = ''.obs;
  var apellidoText = ''.obs;
  var nickName = ''.obs;
  var rol = ''.obs;

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
  var apellidoMedicoTextEmergencia = ''.obs;
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

  Future<void> guardarDatos() async{
    final box = GetStorage();

    box.write('user_name', nombreText.value);
    box.write('user_name_last', apellidoText.value);
    box.write('user_nickname', nickName.value);
    box.write('user_rol', rol.value);
    box.write('user_img_url', 'User_icon.png');


    box.write('user_city', municipioOCiudadText.value);
    box.write('user_departament', departamentoText.value);
    box.write('user_doc_number', numeroDocumentoText.value);
    box.write('user_gender', generoText.value);
    box.write('user_house_number', numeroText.value);
    box.write('user_neighborhood', barrioText.value);
    box.write('user_street_number', calleText.value);
    box.write('user_type_doc', tipoDocumentoText.value);
    box.write('user_type_street', tipoDeCalleText.value);


    box.write('emergency_cel_mobile', numeroCelularTextEmergencia.value);
    box.write('emergency_city', municipioOCiudadTextEmergencia.value);
    box.write('emergency_departament', departamentoTextEmergencia.value);
    box.write('emergency_doc_number', numeroDocumentoTextEmergencia.value);
    box.write('emergency_gender', generoTextEmergencia.value);
    box.write('emergency_house_number', numeroTextEmergencia.value);
    box.write('emergency_last_name', apellidoTextEmergencia.value);
    box.write('emergency_name', nombreTextEmergencia.value);
    box.write('emergency_neighborhood', barrioTextEmergencia.value);
    box.write('emergency_relationship', parentescoEmergencia.value);
    box.write('emergency_street_number', calleTextEmergencia.value);
    box.write('emergency_type_doc', tipoDocumentoTextEmergencia.value);
    box.write('emergency_type_street', tipoDeCalleTextEmergencia.value);


    box.write('medical_insurance', aseguradoraTextEmergencia.value);
    box.write('medical_type_link', tipoVinculacionTextEmergencia.value);


    box.write('doctor_institution', hospitalResidenteTextEmergencia.value);
    box.write('doctor_name', nombreMedicoTextEmergencia.value);
    box.write('doctor_last_name', apellidoMedicoTextEmergencia.value);

    box.write('doctor_specialty', especialidadMedicoTextEmergencia.value);
    box.write('doctor_email', correoTextEmergencia.value);


    //Crear Credenciales Usuario
    var credentialData = CredentialData(
      cel_number: box.read('user_number'), // Replace with initial values
      email: box.read('user_email'),
      id: box.read('user_pass'),
      state: true,
    );

    var credential = Credential(
      data: credentialData, // Replace with initial values
      message: 'new',
      status: true,
    );

    final String jsonString = jsonEncode(credential);
    var baseUrl = 'http://10.0.2.2:5000';
    var urlCredential = '$baseUrl/set_credential/create';
    var headers = {'content-type': 'application/json'};

    await http.post(Uri.parse(urlCredential), body: jsonString, headers: headers).then((http.Response response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.contentLength}");
      print(response.headers);
      print(response.request);
    });

    Credential body = await loginRepository.getDataCredential(credential: box.read('user_email'),
        pass: box.read('user_pass'));
    box.write('id', body.data.id);
    print(body.data.id);



    // Crear User
    var userData = UserData(
        img_url: box.read('user_img_url'),
        last_name: box.read('user_name_last'),
        name: box.read('user_name'),
        nick_name: box.read('user_nickname'),
        rol: box.read('user_rol'),
        state: true);

    var mapUser = jsonEncode({'data': userData,
      'id': box.read('id')});

    var urlUser= '$baseUrl/set_user/create';


    await http.post(Uri.parse(urlUser), body: mapUser, headers: headers).then((http.Response response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.contentLength}");
      print(response.headers);
      print(response.request);
    });



    // Crar info User
    var infoUser = InfoUserData(
        city: box.read('user_city'),
        department: box.read('user_departament'),
        doc_number: box.read('user_doc_number'),
        gender: box.read('user_gender'),
        house_number: box.read('user_house_number'),
        neighborhood: box.read('user_neighborhood'),
        state: true,
        street_number: box.read('user_street_number'),
        type_doc: box.read('user_type_doc'),
        type_street: box.read('user_type_street'));

    var mapInfoUser = jsonEncode({'data': infoUser,
      'id': box.read('id')});

    var urlUserInfo = '$baseUrl/set_user_info/create';


    await http.post(Uri.parse(urlUserInfo), body: mapInfoUser, headers: headers).then((http.Response response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.contentLength}");
      print(response.headers);
      print(response.request);
    });




    // Crear infor emergencia
    var emergencyUser = EmergencyUserData(
        cel_mobile: box.read('emergency_cel_mobile'),
        city: box.read('emergency_city'),
        department: box.read('emergency_departament'),
        doc_number: box.read('emergency_doc_number'),
        gender: box.read('emergency_gender'),
        house_number: box.read('emergency_house_number'),
        last_name: box.read('emergency_last_name'),
        name: box.read('emergency_name'),
        neighborhood: box.read('emergency_neighborhood'),
        relationship: box.read('emergency_relationship'),
        state: true,
        street_number: box.read('emergency_street_number'),
        type_doc: box.read('emergency_type_doc'),
        type_street: box.read('emergency_type_street'));

    var mapEmergencyUser = jsonEncode({'data': emergencyUser,
      'id': box.read('id')});

    var urlUserEmergency = '$baseUrl/set_emergency_info/create';

    await http.post(Uri.parse(urlUserEmergency), body: mapEmergencyUser, headers: headers).then((http.Response response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.contentLength}");
      print(response.headers);
      print(response.request);
    });



    // Crear doctor user
    var doctoUser = DoctorUserData(
        id: '00001',
        email: box.read('doctor_email'),
        institution: box.read('doctor_institution'),
        last_name: box.read('doctor_last_name'),
        name: box.read('doctor_name'),
        specialty: box.read('doctor_specialty'),
        state: true);


    var mapDoctorUser = jsonEncode({'data': doctoUser,
      'id': box.read('id')});

    var urlDoctorUser = '$baseUrl/set_doctor/create';

    await http.post(Uri.parse(urlDoctorUser), body: mapDoctorUser, headers: headers).then((http.Response response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.contentLength}");
      print(response.headers);
      print(response.request);
    });

    DoctorUser medicalUserConsult = await navbarRepository.getDoctorUser(id: box.read('doctor_email'));

    print(medicalUserConsult.data.id);


    // crear info medical User
    var medicalUser = MedicalUserData(
        id_doctor: medicalUserConsult.data.id,
        insurance: box.read('medical_insurance'),
        state: true,
        type_link: box.read('medical_type_link'));

    var mapMedicalUser = jsonEncode({'data': medicalUser,
      'id': box.read('id')});

    var urlMedicalUser = '$baseUrl/set_medical/create';

    await http.post(Uri.parse(urlMedicalUser), body: mapMedicalUser, headers: headers).then((http.Response response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.contentLength}");
      print(response.headers);
      print(response.request);
    });


    String locationMessage = 'Usuario Creado';
    // Imprimir el mensaje en la consola
    EasyLoading.showInfo(locationMessage,
        duration: const Duration(milliseconds: 6000));
    Get.toNamed(Routes.LOGIN);
    clear();



  }
  LoginRepository loginRepository = LoginRepository();



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
    nombreText.value = '';
    apellidoText.value = '';
    nickName.value = '';
    rol.value = '';

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
    apellidoTextEmergencia.value = '';

    // Información de Atención Médica
    aseguradoraTextEmergencia.value = '';
    tipoVinculacionTextEmergencia.value = '';
    nombreMedicoTextEmergencia.value = '';
    especialidadMedicoTextEmergencia.value = '';
    correoTextEmergencia.value = '';
    hospitalResidenteTextEmergencia.value = '';
    apellidoMedicoTextEmergencia.value = '';
  }
}