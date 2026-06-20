import '../../core/network/api_client.dart';
import '../models/AiChatResponse.dart';

class AiChatService {
  final ApiClient _apiClient;

    return AiChatResponse.fromJson(response.data);
  }
}в