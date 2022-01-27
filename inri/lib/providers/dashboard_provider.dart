import 'package:flutter/material.dart';
import 'package:inri/constants/data_type.dart';
import 'package:inri/models/dashboard_model.dart';
import 'package:inri/models/system_status_model.dart';
import 'package:inri/providers/base/base_provider.dart';
import 'package:inri/repositories/dashboard_repository.dart';
import 'package:inri/services/export_csv_service.dart';

class DashboardProvider extends BaseProvider {
  final DashboardRepository _repository = DashboardRepository();
  DataType _dataType = DataType.battery;

  DataType get dataType => _dataType;
  set dataType(DataType type) {
    _dataType = type;
    notifyListeners();
  }

  Future<DashboardModel> fetchDashboard() async {
    try {
      return await _repository.fetchDashboard();
    } catch (e) {
      rethrow;
    }
  }

  Future<SystemStatusModel> fetchStatus() async {
    try {
      return await _repository.fetchStatus();
    } catch (e) {
      rethrow;
    }
  }

  Future exportData(String variableName, DateTimeRange date, String fileName) async {
    toggleLoading();
    try {
      var _data = await _repository.export(variableName, date.start, date.end);
      if (_data.isEmpty) throw 'No data found.';
      await getCsv(_data, fileName);
    } catch (_) {
      rethrow;
    } finally {
      toggleLoading();
    }
  }

  @override
  void cleanProvider() {
    _dataType = DataType.battery;
  }


}
