
import 'package:inri/models/battery_voltage_model.dart';
import 'package:inri/providers/base/base_provider.dart';
import 'package:inri/repositories/battery_repository.dart';

class BatteryVoltageProvider extends BaseProvider {
  final BatteryRepository _repository = BatteryRepository();

  Future<List<BatteryVoltageModel>> fetchBatteryVoltage() async {
    try {
      return await _repository.fetch();
    } catch (e){
      rethrow;
    }
  }

  @override
  void cleanProvider() {
  }

}