import 'package:inri/models/wind_model.dart';
import 'package:inri/providers/base/base_provider.dart';
import 'package:inri/repositories/wind_repository.dart';

class WindProvider extends BaseProvider {
  final WindRepository _repository = WindRepository();
  Future<List<WindModel>> fetchLateral() async {
    try {
      return await _repository.fetchLateral();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<WindModel>> fetchTop() async {
    try {
      return await _repository.fetchTop();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<WindModel>> fetchDirection() async {
    try {
      return await _repository.fetchTop();
    } catch (e) {
      rethrow;
    }
  }

  @override
  void cleanProvider() {}
}
