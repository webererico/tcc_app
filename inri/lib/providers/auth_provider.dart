import 'package:inri/interfaces/shared_preferences.dart';
import 'package:inri/models/user_model.dart';
import 'package:inri/providers/base/base_provider.dart';
import 'package:inri/repositories/auth_repository.dart';

class AuthProvider extends BaseProvider {
  final AuthRepository _authRepository = AuthRepository();

  Future doLogin(String email, String password, bool saveCredentials) async {
    toggleLoading();
    try {
      await _authRepository.login(email, password);
      if (saveCredentials) {
        await Prefs.setLogin(email);
        await Prefs.setPassword(password);
        await Prefs.setSaveCredentials(saveCredentials);
      } else {
        await Prefs.removeLogin;
        await Prefs.removePassword;
        await Prefs.removeSaveCredentials;
      }
    } catch (e) {
      print('caiu');
      throw e;
    } finally {
      toggleLoading();
    }
  }

  Future doRegister(UserModel user) async {
    toggleLoading();
    try {
      await _authRepository.register(user);
    } catch (e) {
      rethrow;
    } finally {
      toggleLoading();
    }
  }

  Future changePassword(String currentPassword, String newPassword) async {
    toggleLoading();
    try {
      return await _authRepository.updatePassword(currentPassword, newPassword);
    } catch (e) {
      rethrow;
    } finally {
      toggleLoading();
    }
  }

  Future doLogout() async {
    await _authRepository.logout();
    await deleteLocalData();
  }

  Future delete() async {
    toggleLoading();
    try {
      await _authRepository.delete();
      await deleteLocalData();
    } catch (e) {
      rethrow;
    } finally {
      toggleLoading();
    }
  }

  Future deleteLocalData() async {
    await Prefs.removeSaveCredentials;
    await Prefs.removeLogin;
    await Prefs.removePassword;
  }

  @override
  void cleanProvider() {}
}
