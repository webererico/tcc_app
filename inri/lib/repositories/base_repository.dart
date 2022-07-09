import 'package:dio/dio.dart';
import 'package:inri/constants/navigation_key.dart';
import 'package:inri/constants/variables.dart';
import 'package:inri/interfaces/http.dart';
import 'package:inri/interfaces/shared_preferences.dart';
import 'package:inri/screens/login/login_screen.dart';

abstract class BaseRepository {
  late Dio dio;

  BaseRepository() {
    dio = HttpHelper(digitalOceanURL)
        .addInterceptor(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              return handler.next(options);
            },
            onResponse: (response, handler) {
              return handler.next(response);
            },
            onError: (DioError e, handler) async {
              if (e.response?.statusCode == 500 || e.response?.statusCode == 401) {
                await Prefs.clear();
                await navigatorKey.currentState?.pushReplacementNamed(LoginScreen.routeName);
              }
              return handler.next(e);
            },
          ),
        )
        .dio;
  }
}
