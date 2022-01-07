import 'package:inri/providers/base/base_provider.dart';

class UserProvider extends BaseProvider {
  Future updateProfile(String name, String occupation, String email) async {
    toggleLoading();
    try {} catch (e) {
    } finally {
      toggleLoading();
    }
  }

  Future updatePassword (String currentPassword, String newPassword) async { 
    toggleLoading();
    try{

    } catch (e){

    } finally {
      toggleLoading();
    }
  }

  @override
  void cleanProvider() {
    // TODO: implement cleanProvider
  }
}
