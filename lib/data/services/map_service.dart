import 'dart:convert';
import '../../core/network/api_client.dart';
import '../../core/network/api_endpoints.dart';
import '../models/map_models.dart';

class MapService {
  final ApiClient _apiClient;
  String? _cachedStyle;

  MapService(this._apiClient);

  Future<String?> getMapStyle() async {
    if (_cachedStyle != null) {
      return _cachedStyle;
      final response = await _apiClien

  Future<List<AddressResponseDto>> searchAddress(String query) async {
    try {
    } catch (_) {}
    return [];
  }
Json(response.data);
      }
    } catch (_) {}
    return null;
  }'',
    );
  }
}в