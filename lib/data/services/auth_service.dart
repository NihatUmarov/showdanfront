import '../../core/network/api_client.dart';
import '../../core/network/api_endpoints.dart';
import '../../core/network/app_exception.dart';
import '../../core/provider/session_provider.dart';
import '../../core/storage/secure_storage.dart';
import '../models/auth_models.dart';


    if (response.statusCode == 200) {
      final tokens = TokenResponse.fromJson(response.data);
      await _sessionProvider.saveSession(
        token: tokens.token,
        final tokens = TokenResponse.fromJson(response.data);
        await _sessionProvider.saveSession(
          token: tokens.token,
          refreshToken: tokens.refreshToken,
          role: tokens.role, // Передает чистый int
        );
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }

      if (response.statusCode == 200 || response.statusCode == 201) {
        final tokens = TokenResponse.fromJson(response.data);
        await _sessionProvider.saveSession(
          token: tokens.token,
          refreshToken: tokens.refreshToken,
          role: tokens.role,
        );
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}