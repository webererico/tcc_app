import 'package:inri/providers/all.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => AuthProvider()),
  ChangeNotifierProvider(create: (_) => BatteryVoltageProvider()),
  ChangeNotifierProvider(create: (_) => MeasuredPowerProvider()),
  ChangeNotifierProvider(create: (_) => TotalEnergyProvider()),
  ChangeNotifierProvider(create: (_) => UserProvider()),
  ChangeNotifierProvider(create: (_) => WindProvider()),
];
