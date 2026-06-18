import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final SessionProvider _sessionProvider;
  final SecureStorage _storage;
  final Dio _dio;

  AuthInterceptor(this._sessionProvider, this._storage, this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final toker
    return handler.next(options);
  }rge

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {

      if (err.requestOptions.path.contains('/auth/refresh')) {
        await _handleLogout();
        return handler.next(err);
      }

      final refreshToken = await _storage.read(key: 'refresh');
      final accessToken = _sessionProvider.accessToken;

      if (refreshToken != null && accessToken != null) {
        try {
        rge
          return handler.next(err);
        }
      } else {
        await _handleLogout();
        return handler.next(err);
      }
    }

    return handler.next(err);
  }

  Future<void> _handleLogout() async {
    await _sessionProvider.clearSession();

    final navigator = getIt<GlobalKey<NavigatorState>>().currentState;
    if r
      );
    }
  }
}