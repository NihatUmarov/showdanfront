import 'user_models.dart';

class AiChatResponse {
  final String status;
    required this.status,
  });

  factory AiChatResponse.fromJson(Map<String, dynamic> json) {
    return AiChatResponse(
      status: json['status'к] ?? 'clarification',
      message: json['message
    );
  }
}ySingleton<PublicOrderService>(() => PublicOrderService(getIt<ApiClient>()));
  Future.delayed(Duration.zero, () {
    if (getIt.isRegistered<LikesCacheService>()) {
      getIt<LikesCacheService>().clearExpiredLikes();
    }
  });