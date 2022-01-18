import 'package:dio/dio.dart';
import 'package:inri/constants/variables.dart';
import 'package:inri/interfaces/http.dart';
import 'package:inri/interfaces/shared_preferences.dart';
import 'package:inri/main.dart';
import 'package:inri/screens/login/login_screen.dart';

abstract class BaseRepository {
  late Dio dio;

  BaseRepository() {
    dio = HttpHelper(baseURL)
        .addInterceptor(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              return handler.next(options);
            },
            onResponse: (response, handler) {
              return handler.next(response);
            },
            onError: (DioError e, handler) async {
              if (e.response?.statusCode == 500){
                print('entrou');
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
