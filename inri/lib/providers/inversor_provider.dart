import 'package:inri/models/inversor_model.dart';
import 'package:inri/providers/base/base_provider.dart';
import 'package:inri/repositories/inversor_repository.dart';

class InversorProvider extends BaseProvider {
  final InversorRepository _repository = InversorRepository();
  
  Future<List<InversorModel>> fetchInversorStatus() async {
    return _repository.fetch();
  }

  @override
  void cleanProvider() {}
}
