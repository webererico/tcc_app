import 'package:dio/dio.dart';
import 'package:inri/interfaces/shared_preferences.dart';
import 'package:inri/models/battery_voltage_model.dart';
import 'package:inri/repositories/base_repository.dart';

class BatteryRepository extends BaseRepository {
  Future<List<BatteryVoltageModel>> fetch() async {
    try {
      List<BatteryVoltageModel> batteryList = [];
      final _response = await dio.get(
        '/battery-voltage',
        options: Options(
          headers: {'Authorization': await Prefs.accessToken},
        ),
      );
      (_response.data['data'] as Map).forEach((key, value) {
        return batteryList.add(BatteryVoltageModel.fromMap(value));
      });

      return batteryList;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }
}
