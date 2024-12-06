import 'package:get_storage/get_storage.dart';
import 'package:kibo/app/data/provider/login_provider.dart';
import 'package:kibo/app/data/repository/login_repository.dart';
import 'package:kibo/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kibo/app/data/repository/navbar_repository.dart';


import '../data/model/user/user.dart';
import '../data/model/info_user/info_user.dart';
import '../data/model/emergency_user/emergency_user.dart';
import '../data/model/medical_user/medical_user.dart';
import '../data/model/doctor_user/doctor_user.dart';

import '../data/model/credential/credential.dart';

class LoginController extends GetxController {
  LoginRepository loginRepository = LoginRepository();
  NavbarRepository navbarRepository = NavbarRepository();

  final UserController = TextEditingController(); // Controlador para User
  final passwordController =
      TextEditingController(); // Controlador para contraseña
  get formKeyLogin => null;

  var isPasswordAlert = false.obs;
  var isUserAlert = false.obs;
  var isButtonEnabled = false.obs; // Estado del botón

  // Verifica si los campos no están vacíos
  void checkButtonState() {
    if (UserController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isButtonEnabled.value = true;
    } else {
      isButtonEnabled.value = false;
    }
    print(isButtonEnabled.value);
  }

  void validateCredentials() async {
    final box = GetStorage();
    try {
    Credential credential = await getDataUser();
    List<String> correctUser = [
      credential.data.email,
      credential.data.cel_number
    ]; // User correcto
    // Verifica si el correo y la contraseña son correctos
    if (correctUser.contains(UserController.text)) {
      isUserAlert.value = false;
      isPasswordAlert.value = false;
      User user = await getUser(credential.data.id);
      String fullNameUser = "${user.data.name} ${user.data.last_name}";
      box.write('user_name', user.data.name);
      box.write('user_name_last', user.data.last_name);
      box.write('user_full_name', fullNameUser);
      box.write('user_nickname', user.data.nick_name);
      box.write('user_rol', user.data.rol);
      box.write('user_img_url', user.data.img_url);


      InfoUser infoUser = await getUserInfo(credential.data.id);
      box.write('user_city', infoUser.data.city);
      box.write('user_departament', infoUser.data.department);
      box.write('user_doc_number', infoUser.data.doc_number);
      box.write('user_gender', infoUser.data.gender);
      box.write('user_house_number', infoUser.data.house_number);
      box.write('user_neighborhood', infoUser.data.neighborhood);
      box.write('user_street_number', infoUser.data.street_number);
      box.write('user_type_doc', infoUser.data.type_doc);
      box.write('user_type_street', infoUser.data.type_street);


      EmergencyUser emergencyUser = await getUserEmergency(credential.data.id);
      String fullNameEmergency = "${emergencyUser.data.name} ${emergencyUser.data.last_name}";
      box.write('emergency_cel_mobile', emergencyUser.data.cel_mobile);
      box.write('emergency_city', emergencyUser.data.city);
      box.write('emergency_departament', emergencyUser.data.department);
      box.write('emergency_doc_number', emergencyUser.data.doc_number);
      box.write('emergency_gender', emergencyUser.data.gender);
      box.write('emergency_house_number', emergencyUser.data.house_number);
      box.write('emergency_last_name', emergencyUser.data.last_name);
      box.write('emergency_name', emergencyUser.data.name);
      box.write('emergency_full_name', fullNameEmergency);
      box.write('emergency_neighborhood', emergencyUser.data.neighborhood);
      box.write('emergency_relationship', emergencyUser.data.relationship);
      box.write('emergency_street_number', emergencyUser.data.street_number);
      box.write('emergency_type_doc', emergencyUser.data.type_doc);
      box.write('emergency_type_street', emergencyUser.data.type_street);


      MedicalUser medicalUser = await getMedical(credential.data.id);
      box.write('medical_insurance', medicalUser.data.insurance);
      box.write('medical_type_link', medicalUser.data.type_link);


      DoctorUser doctorUser = await getDoctorUser(medicalUser.data.id_doctor);
      String fullNameDoctor = "${doctorUser.data.name} ${doctorUser.data.last_name}";
      box.write('doctor_institution', doctorUser.data.institution);
      box.write('doctor_last_name', doctorUser.data.last_name);
      box.write('doctor_full_name', fullNameDoctor);
      box.write('doctor_name', doctorUser.data.name);
      box.write('doctor_specialty', doctorUser.data.specialty);
      box.write('doctor_email', doctorUser.data.email);



    }
    if (!isPasswordAlert.value || !isUserAlert.value) {
      EasyLoading.showSuccess('Inicio de sesión exitoso.');
      clearLoginData(); // Limpia la información antes de navegar
      Get.toNamed(Routes.NAVBAR);
    }
    box.write('id', credential.data.id);
    box.write('user_email', credential.data.email);
    box.write('user_number', credential.data.cel_number);
    } catch (e) {
      EasyLoading.showInfo(e.toString()); // Muestra el mensaje de error
      isUserAlert.value = true;
      isPasswordAlert.value = true;

    }
  }

  // Método para limpiar los datos del login
  void clearLoginData() {
    UserController.clear();
    passwordController.clear();
    isPasswordAlert.value = false;
    isUserAlert.value = false;
    isButtonEnabled.value = false;
  }

  void backLoginRegister() {
    Get.toNamed(Routes.LOGINREGISTER);
  }
  Future<Credential> getDataUser() async{
    Credential body = await loginRepository.getDataCredential(credential: UserController.text, pass: passwordController.text);
    return body;
  }

  Future<User> getUser(String id) async{
    User user = await navbarRepository.getUser(id: id);
    String name = user.data.name;
    print("nombre $name");
    return user;
  }

  Future<InfoUser> getUserInfo(String id) async{
    InfoUser infoUser = await navbarRepository.getUserInfo(id: id);
    String neighborhood = infoUser.data.neighborhood;
    print("Barrio $neighborhood");
    return infoUser;
  }

  Future<EmergencyUser> getUserEmergency(String id) async{
    EmergencyUser emergencyUser = await navbarRepository.getUserEmergency(id: id);
    String name = emergencyUser.data.name;
    print("nombre de contacto emergencia $name");
    return emergencyUser;
  }

  Future<MedicalUser> getMedical(String id) async{
    MedicalUser medicalUser = await navbarRepository.getMedical(id: id);
    String id_doctor = medicalUser.data.id_doctor;
    print("id_doctor $id_doctor");
    return medicalUser;
  }

  Future<DoctorUser> getDoctorUser(String id) async{
    DoctorUser doctorUser = await navbarRepository.getDoctorUser(id: id);
    String institucion = doctorUser.data.institution;
    print("La institucion $institucion");
    return doctorUser;
  }


  void onClose() {
    // Asegúrate de limpiar los controladores al cerrar el controlador
    UserController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
