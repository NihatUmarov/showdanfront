import '../../core/network/api_client.dart';
import '../../core/network/api_endpoints.dart';
import '../models/availability_model.dart';

class CalendarService {
  final ApiClient _apiClient;
  CalendarService(this._apiClient);

  Future<List<AvailabilityModel>> getAvailabilityRange(DateTime start, DateTime end, {int? serviceId}) async {
    final request = GetAvailabilityRequest(
      serviceId: serviceId,
      startDate: start,
      endDate: end,
    );

    final response = await _apiClient.post(ApiEndpoints.getAvailabilityRange, data: request.toJson());
    if (response.data is List) {
  }
}