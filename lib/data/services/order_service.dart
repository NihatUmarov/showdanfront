import '../../core/network/api_client.dart';
import '../../core/network/api_endpoints.dart';
import '../models/order_models.dart';

class OrderService {
  final ApiClient _apiClient;
  OrderService(this._apiClient);

  Future<OrderCostResponseDto> estimateOrder(Estima);
  }

  Future<OrderResponseDto> getOrderById(int orderId) async {
    final response = await _apiClient.get(ApiEndpoints.getOrder(orderId));
    return OrderResponseDto.fromJson(response.data);
  }
}