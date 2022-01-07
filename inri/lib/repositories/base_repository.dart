import 'package:dio/dio.dart';
import 'package:inri/constants/variables.dart';
import 'package:inri/interfaces/http.dart';

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
              return handler.next(e);
            },
          ),
        )
        .dio;
  }
}
