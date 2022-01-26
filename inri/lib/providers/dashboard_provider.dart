import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:inri/constants/data_type.dart';
import 'package:inri/models/dashboard_model.dart';
import 'package:inri/models/system_status_model.dart';
import 'package:inri/providers/base/base_provider.dart';
import 'package:inri/repositories/dashboard_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

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

  Future exportData(String variableName, DateTimeRange date) async {
    var _data = await _repository.export(variableName, date.start, date.end);
    await getCsv(_data);
  }

  @override
  void cleanProvider() {
    _dataType = DataType.battery;
  }

  getCsv(List<dynamic> data) async {
    var csvData = List<List<dynamic>>.empty(growable: true);

    List<dynamic> row = List.empty(growable: true);
    row.add("Max: ");
    row.add("Max: ");
    row.add("Avarage: ");
    row.add("Deviation: ");
    row.add("Created At: ");
    data.forEach((element) {
      print(element.toString());
      // csvData.add([element.max, element.min, element.average, element.deviation, element.createdAt]);;
    });

    if (await Permission.storage.request().isGranted) {
      String dir = (await getExternalStorageDirectory())!.path + "/mycsv.csv";
      String file = "$dir";

      File f = File(file);

      String csv = const ListToCsvConverter().convert(csvData);
      await f.writeAsString(csv);
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
    }
  }
}
