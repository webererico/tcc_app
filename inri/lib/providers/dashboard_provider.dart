import 'package:inri/providers/base/base_provider.dart';

class DashboardProvider extends BaseProvider {


  Future fetchDashboard() async {
    toggleLoading();
    try{
      
    }catch(e){
      rethrow;
    } finally {
      toggleLoading();
    }
  }

  @override
  void cleanProvider() {}
}
