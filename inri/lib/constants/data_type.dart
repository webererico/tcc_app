enum DataType { battery, windTop, windLateral, power, totalEnergy, windDirection }

extension dataTypeExtension on DataType {
  String get title {
    switch (this) {
      case DataType.battery:
        return 'Battery Voltage';
      case DataType.windTop:
        return 'Wind Speed Top';
      case DataType.windLateral:
        return 'Wind Speed Lateral';
      case DataType.power:
        return 'Power Generated';
      case DataType.totalEnergy:
        return 'Total Acumulated Energy';
      case DataType.windDirection:
        return 'Wind Direction';
    }
  }

  String get unit {
    switch (this) {
      case DataType.battery:
        return 'V';
      case DataType.windTop:
        return 'm/s';
      case DataType.windLateral:
        return 'm/s';
      case DataType.power:
        return 'kWh';
      case DataType.totalEnergy:
        return 'kWh';
      case DataType.windDirection:
        return 'º';
    }
  }
}
