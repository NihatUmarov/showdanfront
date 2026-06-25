import 'package:dio/dio.dart';
import '../../core/provider/session_provider.dart';
import '../storage/secure_storage.d

  AppException _handleError(DioException e) {
    String message = "Произошла непредвиденная ошибка";
    if (e.response != null && e.response?.data != null) {
      final data = e.response!.data;
      if (data is Map) {
        message = data['message'] ?? data.toString();
      } else {
        message = data.toString();
      }
    } else {
    s
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          message = "Время ожидания истекло";
          break;
        case DioExceptionType.connectionError:
          message = "Нет соединения с сервером";
          break;
        default:
          message = "Ошибка сети";
      }
    }
    return AppException(message);
  }
}
public ss();