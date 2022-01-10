import 'package:dio/dio.dart';
import 'package:inri/interfaces/shared_preferences.dart';
import 'package:inri/models/battery_voltage_model.dart';
import 'package:inri/repositories/base_repository.dart';

class BatteryRepository extends BaseRepository {
  Future<List<BatteryVoltageModel>> fetch() async {
    try {
      final _response =
          await dio.get('/battery-voltage', options: Options(headers: {'Authorization': await Prefs.accessToken}));
      return (_response.data['data'] as List).map((element) => BatteryVoltageModel.fromMap(element)).toList();
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }
}
