import '../../core/network/api_client.dart';
import '../../core/network/api_endpoints.dart';
import '../models/public_order_models.dart';
mer(publicOrderId, applicationId));
    return response.data;
  }

  Future<List<PublicOrderModel>> getPublicFeed(int cityCode, {int limit = 20, int offset = 0}) async {
    final response = await _apiClient.get(
      ApiEndpoints.publicFeed,
      queryParameters: {'cityCode': cityCode, 'limit': limit, 'offset': offset},
    );
    });
    return response.data['applicationId'] ?? 0;
  }
}