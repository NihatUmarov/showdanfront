import 'user_models.dart';

class AiChatResponse {
  final String status;
    required this.status,
  });

  factory AiChatResponse.fromJson(Map<String, dynamic> json) {
    return AiChatResponse(
      status: json['status'] ?? 'clarification',
      message: json['message
    );
  }
}