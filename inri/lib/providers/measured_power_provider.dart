import 'package:inri/models/power_model.dart';
import 'package:inri/providers/base/base_provider.dart';
import 'package:inri/repositories/power_respository.dart';

class MeasuredPowerProvider extends BaseProvider {
  final PowerRepository _repository = PowerRepository();

  Future<List<PowerModel>> fetchPower() async {
    try{
      return await _repository.fetch();
    } catch (e){
      rethrow;
    }
  }

  @override
  void cleanProvider() {
  }
}