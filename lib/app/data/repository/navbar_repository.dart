import '../model/user/user.dart';
import '../model/info_user/info_user.dart';
import '../model/emergency_user/emergency_user.dart';
import '../model/medical_user/medical_user.dart';
import '../model/doctor_user/doctor_user.dart';


import '../provider/navbar_provider.dart';

NavbarProvider navbarProvider = NavbarProvider();

class NavbarRepository {

  Future<User> getUser({required String id}) async{
    final raw = await navbarProvider.getUser(id: id);
    final data = raw.body;
    User user = User.fromJson(data);
    return user;
  }
  Future<InfoUser> getUserInfo({required String id}) async{
    final raw = await navbarProvider.getUserInfo(id: id);
    final data = raw.body;
    InfoUser infoUser = InfoUser.fromJson(data);
    return infoUser;
  }
  Future<EmergencyUser> getUserEmergency({required String id}) async{
    final raw = await navbarProvider.getUserEmergency(id: id);
    final data = raw.body;
    EmergencyUser emergencyUser = EmergencyUser.fromJson(data);
    return emergencyUser;
  }

  Future<MedicalUser> getMedical({required String id}) async{
    final raw = await navbarProvider.getMedical(id: id);
    final data = raw.body;
    MedicalUser medicalUser = MedicalUser.fromJson(data);
    return medicalUser;
  }

  Future<DoctorUser> getDoctorUser({required String id}) async{
    final raw = await navbarProvider.getDoctorUser(id: id);
    final data = raw.body;
    DoctorUser doctorUser = DoctorUser.fromJson(data);
    return doctorUser;
  }
}
