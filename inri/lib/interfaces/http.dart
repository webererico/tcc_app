import 'package:dio/dio.dart';

class HttpHelper {
  final String _url;
  late final BaseOptions _options;
  late final Dio _dio;
  Dio get dio => _dio;

  HttpHelper(this._url) {
    _buildBaseOptions();
    _buildHttp();
  }

  void _buildBaseOptions() async {
    _options = BaseOptions(
      baseUrl: _url,
      responseType: ResponseType.json,
    );
  }

  void _buildHttp() {
    _dio = Dio(_options);
  }

  HttpHelper addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
    return this;
  }
}
