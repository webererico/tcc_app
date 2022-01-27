  import 'dart:io';
import 'package:csv/csv.dart';
import 'package:inri/utils/formatters/date_formater.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_extend/share_extend.dart';

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