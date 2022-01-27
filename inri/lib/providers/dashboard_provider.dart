import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:inri/constants/data_type.dart';
import 'package:inri/models/dashboard_model.dart';
import 'package:inri/models/system_status_model.dart';
import 'package:inri/providers/base/base_provider.dart';
import 'package:inri/repositories/dashboard_repository.dart';
import 'package:inri/utils/formatters/date_formater.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_extend/share_extend.dart';

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

  getCsv(List<dynamic> data, String fileName) async {
    var csvData = List<List<dynamic>>.empty(growable: true);

    List<dynamic> row = List.empty(growable: true);
    row.add("Max: ");
    row.add("Min: ");
    row.add("Avarage: ");
    row.add("Deviation: ");
    row.add("Created At: ");
    csvData.add(row);
    data.forEach((element) {
      csvData.add([
        element['max'],
        element['min'],
        element['average'],
        element['deviation'],
        dateFormat.format(DateTime.parse(element['created_at']))
      ]);
    });

    if (await Permission.storage.request().isGranted) {
      String dir = (await getTemporaryDirectory()).absolute.path + "/$fileName";
      String file = "$dir";

      File f = File(file + '.csv');

      String csv = const ListToCsvConverter().convert(csvData);
      await f.writeAsString(csv);
      await ShareExtend.share(f.path, "file");
    } else {}
  }
}
