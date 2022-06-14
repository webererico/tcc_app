import 'package:inri/models/user_model.dart';
import 'package:inri/providers/base/base_provider.dart';
import 'package:inri/repositories/user_respository.dart';

class UserProvider extends BaseProvider {
  final UserRepository _userRepository = UserRepository();

  Future updateProfile(UserModel user) async {
    toggleLoading();
    try {
      await _userRepository.updateProfile(user);
    } catch (e) {
      rethrow;
    } finally {
      toggleLoading();
    }
  }

  Future updatePassword(String currentPassword, String newPassword) async {
    toggleLoading();
    try {} catch (e) {
    } finally {
      toggleLoading();
    }
  }

  Future<UserModel> fetchProfile() async {
    return _userRepository.fetchProfile();
  }

  @override
  void cleanProvider() {
  }
}
