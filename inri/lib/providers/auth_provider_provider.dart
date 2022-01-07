import 'package:inri/interfaces/shared_preferences.dart';
import 'package:inri/providers/base/base_provider.dart';

class AuthProvider extends BaseProvider {
  doLogin(String email, String password, bool saveCredentials) async {
    toggleLoading();
    if (saveCredentials) {
      await Prefs.setLogin(email);
      await Prefs.setPassword(password);
      await Prefs.setSaveCredentials(saveCredentials);
    } else {
      await Prefs.removeLogin;
      await Prefs.removePassword;
      await Prefs.removeSaveCredentials;
    }
    toggleLoading();
  }

  doRegister(String fullName, String email, String password, String occupation, String registerToken){

  }

  changePassword(String oldPassword, String newPassword) async {
    toggleLoading();
    try {} catch (e) {
    } finally {
      toggleLoading();
    }
  }

  @override
  void cleanProvider() {
    // TODO: implement cleanProvider
  }
}
