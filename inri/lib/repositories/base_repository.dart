import 'package:dio/dio.dart';
import 'package:inri/constants/variables.dart';
import 'package:inri/interfaces/http.dart';
import 'package:inri/main.dart';

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
                await navigatorKey.currentState?.pushNamed('/someRoute');

              }
              return handler.next(e);
            },
          ),
        )
        .dio;
  }
}
