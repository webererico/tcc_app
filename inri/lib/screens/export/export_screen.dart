import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inri/components/custom_date_range.dart';
import 'package:inri/components/custom_dropdown.dart';
import 'package:inri/components/custom_scaffold.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/providers/dashboard_provider.dart';
import 'package:inri/utils/formatters/date_formater.dart';
import 'package:inri/utils/snackbar_message.dart';
import 'package:provider/provider.dart';

class ExportScreen extends StatefulWidget {
  static const routeName = '/export-screen';

  const ExportScreen({Key? key}) : super(key: key);

  @override
  _ExportScreenState createState() => _ExportScreenState();
}

class _ExportScreenState extends State<ExportScreen> {
  String? _variableName;
  DateTimeRange? _dateRange;
  String? _exportFormat;

  String get _title => _dateRange != null
      ? '${dateFormat.format(_dateRange!.start)} until ${dateFormat.format(_dateRange!.end)}'
      : 'Select date range';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Export Data',
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            CustomDropdown(
              _variableName,
              const <String>[
                'Battery Voltage',
                'Wind Speed Lateral',
                'Wind Speed Top',
                'Wind Direction',
                'Total Acumulated Energy',
                'Measured Power'
              ],
              (value) => setState(() => _variableName = value),
              'Select the variable',
            ),
            const SizedBox(height: 40),
            CustomDateRange(
              _title,
              (value) => setState(() => _dateRange = value),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomDropdown(
              _exportFormat,
              const <String>['PDF', 'CSV'],
              (value) => setState(() => _exportFormat = value),
              'Select the export format',
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer<DashboardProvider>(builder: (context, dashboardProvider, _) {
        if (dashboardProvider.isLoading) return const Center(child: Loader());
        return FloatingActionButton.extended(
            label: const Text('Export Data'),
            icon: const FaIcon(FontAwesomeIcons.fileExport),
            onPressed: () async {
              if (_dateRange != null && _variableName != null)
                return dashboardProvider.exportData(_variableName!, _dateRange!);
              return showSnackbar(context, 'Please, inform all the variable', messageType.ERROR);
            });
      }),
    );
  }
}
