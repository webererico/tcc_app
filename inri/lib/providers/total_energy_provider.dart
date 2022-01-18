import 'package:inri/models/total_energy_model.dart';
import 'package:inri/providers/base/base_provider.dart';
import 'package:inri/repositories/energy_respository.dart';

class TotalEnergyProvider extends BaseProvider {
  final EnergyRepository _repository = EnergyRepository();
  Future<List<TotalEnergyModel>> fetchTotalEnergy() async {
    try {
      return await _repository.fetch();
    } catch (e) {
      rethrow;
    }
  }

  @override
  void cleanProvider() {}
}
