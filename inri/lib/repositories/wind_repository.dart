import 'package:dio/dio.dart';
import 'package:inri/interfaces/shared_preferences.dart';
import 'package:inri/models/wind_model.dart';
import 'package:inri/repositories/base_repository.dart';

class WindRepository extends BaseRepository {
  Future<List<WindModel>> fetchTop() async {
    try {
      List<WindModel> batteryList = [];
      final _response = await dio.get('/wind/top', options: Options(headers: {'Authorization': await Prefs.accessToken}));
      (_response.data['data'] as Map).forEach((key, value) {
        return batteryList.add(WindModel.fromMap(value));
      });

      return batteryList;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<List<WindModel>> fetchLateral() async {
    try {
      List<WindModel> batteryList = [];
      final _response = await dio.get('/wind/lateral', options: Options(headers: {'Authorization': await Prefs.accessToken}));
      (_response.data['data'] as Map).forEach((key, value) {
        return batteryList.add(WindModel.fromMap(value));
      });

      return batteryList;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }
}
