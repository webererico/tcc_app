import 'package:dio/dio.dart';
import 'package:inri/interfaces/shared_preferences.dart';
import 'package:inri/models/power_model.dart';
import 'package:inri/repositories/base_repository.dart';

class PowerRepository extends BaseRepository {
  Future<List<PowerModel>> fetch() async {
    try {
      List<PowerModel> powerList = [];
      final _response =
          await dio.get('/power', options: Options(headers: {'Authorization': await Prefs.accessToken}));
      (_response.data['data'] as Map).forEach((key, value) {
        return powerList.add(PowerModel.fromMap(value));
      });
      
      return powerList;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }
}
