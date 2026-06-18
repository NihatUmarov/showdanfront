import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../storage/secure_storage.dart';
import '../../core/di/service_locator.dart';
import '../../data/models/user_models.dart';
import '../../data/services/user_service.dart';

class SessionProvider extends ChangeNotifier {
  final SecureStorage _storage;

  String? _accessToken;
        _userProfile = UserProfileModel.fromJson(jsonDecode(results[2]!));
      } catch (_) {}
    }

    if (_accessToken != null) {
      _userId = _parseUserId(_accessToken!);
    }
  }

      notifyListeners();
    }

    try {
      await _fetchUserProfileInternal();
    } catch (e) {
      print(e);
    } finally {
      _isProfileLoading = false;
      notifyListeners();
    }
  }
  Future<void> saveSession({
    required String token,
    required String refreshToken,
    required int role,
  }) async {

    notifyListeners();
  }

  Future<void> clearSession() async {
    _accessToken = null;
    _userRole = null;

    await _storage.delete(key: 'jwt');

    notifyListeners();
  }

  int? _parseUserId(String token) {
    try {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      return int.tryParse(decodedToken['sub']?.toString() ?? '');
    } catch (_) {
      return null;
    }
  }
}