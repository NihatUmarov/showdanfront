
import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
    ergwr
        } on DioException catch (retryErr) {
          return super.onError(retryErr, handler);
        }
      }
    }
    return super.onError(err, handler);
  }

  bool _shouldRetry(DioException err) {
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        egrew
    }

    return false;
  }
}