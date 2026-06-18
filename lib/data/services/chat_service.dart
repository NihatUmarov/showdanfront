import '../../core/network/api_endpoints.dart';
import '../../core/network/api_client.dart';
import '../models/chats_models.dart';

class ChatService {
  final ApiClient _apiClient;
  ChatService(this._apiClient);


  Future<ChatPreviewModel?> findChatByOrder(int orderId) async {
    try {
      final chats = await getMyChats();
      return chats.firstWhere(
}