import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SecureStorage {

  final _storage = const FlutterSecureStorage();
  String? _cachedLang;
  Future<void> write({required String key, required String value}) async {
    await _storage.write(key: key, valu


  Future<int?> getUserId() async {
    final token = await getToken();
    if (token != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      return int.tryParse(decodedToken['sub']?.toString() ?? '');
    }
    return null;
  }
}