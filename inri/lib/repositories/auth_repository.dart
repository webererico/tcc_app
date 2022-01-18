import 'package:dio/dio.dart';
import 'package:inri/interfaces/shared_preferences.dart';
import 'package:inri/models/user_model.dart';
import 'package:inri/repositories/base_repository.dart';

class AuthRepository extends BaseRepository {
  Future login(String email, String password) async {
    try {
      var _response = await dio.post('login', data: {'email': email, 'password': password});
      List<String> tokenList = _response.data['access_token'].toString().split('|');
      await Prefs.setAccessToken(tokenList[1]);
      await Prefs.setUserId(_response.data['data']['id']);
      await Prefs.setUserName(_response.data['data']['name']);
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future logout() async {
    await dio.get('logout', options: Options(headers: {'Authorization': await Prefs.accessToken}));
  }

  Future register(UserModel user) async {
    try {
      await dio.post(
        'register',
        data: user.toJson(),
      );
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future updatePassword(String currentPassword, String newPassword) async {
    try {
      var _response = await dio.post(
        'change/password',
        options: Options(headers: {'Authorization': await Prefs.accessToken}),
        data: {'current_password': currentPassword, 'new_password': newPassword},
      );
      return _response.data['message'];
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future delete() async {
    try {
      await dio.get(
        'delete',
        options: Options(headers: {'Authorization': await Prefs.accessToken}),
      );
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }
}
