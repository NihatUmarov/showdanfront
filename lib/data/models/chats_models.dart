class ChatPreviewModel {
  final int interlocutorId;
  final String? name;

  ChatPreviewModel({
    required this.interlocutorId,
    this.name,
  });

  factory ChatPreviewModel.fromJson(Map<String, dynamic> json) {
    return ChatPreviewModel(
      interlocutorId: json['id'] ?? 0,
      name: json['n'],
    );
  }
  Map<String, dynamic> toJson() => {
    'id': interlocutorId,
    'n': name,
    'ava': photoUrl,
}

class ChatMessageModel {
  final int id;
  final int fromUserId;к

  ChatMessageModel({
    required this.id,
    required this.fromUserId,
    this.orderId,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'] ?? 0,
    );
  }

}