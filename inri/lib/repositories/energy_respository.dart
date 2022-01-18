import 'package:dio/dio.dart';
import 'package:inri/interfaces/shared_preferences.dart';
import 'package:inri/models/total_energy_model.dart';
import 'package:inri/repositories/base_repository.dart';

class EnergyRepository extends BaseRepository {
  Future<List<TotalEnergyModel>> fetch() async {
    try {
      List<TotalEnergyModel> batteryList = [];
      final _response =
          await dio.get('/energy', options: Options(headers: {'Authorization': await Prefs.accessToken}));
       (_response.data['data'] as Map).forEach((key, value) {
        return batteryList.add(TotalEnergyModel.fromMap(value));
      });
      
      return batteryList;
    } on DioError catch (e) {
      throw e.response?.data['message'];
    }
  }
}
