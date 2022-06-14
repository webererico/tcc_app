import 'package:flutter/material.dart';
import 'package:inri/screens/all_data.dart/all_data_screen.dart';
import 'package:inri/screens/battery_voltage/battery_voltage_screen.dart';
import 'package:inri/screens/change_password/change_password_screen.dart';
import 'package:inri/screens/dashboard/dashboard_screen.dart';
import 'package:inri/screens/export/export_screen.dart';
import 'package:inri/screens/login/login_screen.dart';
import 'package:inri/screens/measured_power/measured_power_screen.dart';
import 'package:inri/screens/profile/profile_screen.dart';
import 'package:inri/screens/register/register_screen.dart';
import 'package:inri/screens/status/status_screen.dart';
import 'package:inri/screens/total_energy/total_energy_screen.dart';
import 'package:inri/screens/wind_direction/wind_direction_screen.dart';
import 'package:inri/screens/wind_speed/wind_speed_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  DashboardScreen.routeName: (context) => const DashboardScreen(),
  windSpeedScreen.routeName: (context) => const windSpeedScreen(),
  WindDirectionScreen.routeName: (context) => const WindDirectionScreen(),
  TotalEnergyScreen.routeName: (context) => const TotalEnergyScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  MeasuredPowerScreen.routeName: (context) => const MeasuredPowerScreen(),
  ChangePasswordScreen.routeNamed: (context) => ChangePasswordScreen(),
  BatteryVoltageScreen.routeNamed: (context) => const BatteryVoltageScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  AllDataScreen.routeNamed: (context) => const AllDataScreen(),
  ExportScreen.routeName: (context) => const ExportScreen(),
  StatusScreen.routeName: (context) => const StatusScreen(),
};
