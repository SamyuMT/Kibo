import '../model/user/user.dart';
import '../provider/login_provider.dart';

LoginProvider loginProvider = LoginProvider();

class LoginRepository {
  Future<User> getDataUser({required String credential, required String pass}) async{
    final raw = await loginProvider.getDataUser(credential: credential, pass: pass);
    final data = raw.body;
    User user = User.fromJson(data);
    return user;
  }
}
