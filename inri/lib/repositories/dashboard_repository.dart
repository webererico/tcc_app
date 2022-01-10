
import 'package:dio/dio.dart';
import 'package:inri/interfaces/shared_preferences.dart';
import 'package:inri/models/dashboard_model.dart';
import 'package:inri/models/system_status_model.dart';
import 'package:inri/repositories/base_repository.dart';

class DashboardRepository extends BaseRepository {

  Future<DashboardModel> fetchDashboard () async {
    try{
      final _response = await dio.get('dashboard', options: Options(headers: {'Authorization': await Prefs.accessToken}));
      return DashboardModel.fromMap(_response.data['data']);
    } on DioError catch (e){
      throw e.response?.data['message'];
    }
  }

  Future<SystemStatusModel> fetchStatus () async {
    try {
      final _response = await dio.get('/status', options: Options(headers: {'Authorization': await Prefs.accessToken}));
      return SystemStatusModel.fromMap(_response.data['data']);
    } on DioError catch (e){
      throw e.response?.data['message'];
    }
  }
  
}