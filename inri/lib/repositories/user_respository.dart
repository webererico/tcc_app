import 'package:dio/dio.dart';
import 'package:inri/interfaces/shared_preferences.dart';
import 'package:inri/models/user_model.dart';
import 'package:inri/repositories/base_repository.dart';

class UserRepository extends BaseRepository {
  Future<UserModel> fetchProfile() async {
    try {
      var _response = await dio.get('profile', options: Options(headers: {'Authorization': await Prefs.accessToken}));
      return UserModel.fromMap(_response.data);
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future updateProfile(UserModel user) async {
    try {
      await dio.patch(
        'profile',
        options: Options(headers: {'Authorization': await Prefs.accessToken}),
        data: user.toJson(),
      );
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }
}
