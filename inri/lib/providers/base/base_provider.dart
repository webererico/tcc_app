import 'package:flutter/widgets.dart';

abstract class BaseProvider extends ChangeNotifier {
  bool _loading = false;

  void toggleLoading() {
    _loading = !_loading;
    notifyListeners();
  }

  set loading(bool value) => _loading = value;
  get isLoading => _loading;
  void cleanProvider();
}
