import 'package:inri/constants/data_type.dart';
import 'package:inri/models/dashboard_model.dart';
import 'package:inri/models/system_status_model.dart';
import 'package:inri/providers/base/base_provider.dart';
import 'package:inri/repositories/dashboard_repository.dart';

class DashboardProvider extends BaseProvider {
  final DashboardRepository _repository = DashboardRepository();
  DataType _dataType = DataType.battery;

  DataType get dataType => _dataType;
  set dataType(DataType type){
    _dataType = type;
    notifyListeners();
  }

  Future<DashboardModel> fetchDashboard() async {
    try{
      return await _repository.fetchDashboard();
    }catch(e){
      rethrow;
    }
  }

  Future<SystemStatusModel> fetchStatus() async {
    try{
      return await _repository.fetchStatus();
    } catch (e){ 
      rethrow;
    }
  }

  @override
  void cleanProvider() {
    _dataType = DataType.battery;
  }
}
