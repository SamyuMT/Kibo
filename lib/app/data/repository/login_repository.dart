import '../model/credential/credential.dart';
import '../provider/login_provider.dart';

LoginProvider credentialProvider = LoginProvider();

class LoginRepository {
  Future<Credential> getDataCredential({required String credential, required String pass}) async{
    final raw = await credentialProvider.getDataCredential(credential: credential, pass: pass);
    final data = raw.body;
    Credential user = Credential.fromJson(data);
    return user;
  }
}
