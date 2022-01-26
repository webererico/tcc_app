import 'package:dio/dio.dart';
import 'package:inri/interfaces/shared_preferences.dart';
import 'package:inri/models/inversor_model.dart';
import 'package:inri/repositories/base_repository.dart';

class InversorRepository extends BaseRepository {
  Future<List<InversorModel>> fetch() async {
    try {
      List<InversorModel> _inversorStatusList = [];
      final _response =
          await dio.get('status/inversor', options: Options(headers: {'Authorization': await Prefs.accessToken}));
      (_response.data['data'] as Map).forEach((key, value) {
        return _inversorStatusList.add(InversorModel.fromMap(value));
      });

      return _inversorStatusList;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }
}
