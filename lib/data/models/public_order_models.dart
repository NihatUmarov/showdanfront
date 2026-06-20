import 'availability_model.dart'; // Для parseServerUtc

class PublicOrderModel {
  final int id;
  final DateTime startTimeUtc;
  final DateTime endTimeUtc;

  final int cityId; // ИСПРАВЛЕНО: String cityCode -> int cityId

  final String? fullAddress;
    this.clientAvatar,
    required this.applicationsCount,
    required this.createdAt,
  });

  factory PublicOrderModel.fromJson(Map<Str
  final double bidPrice;
  final double travelPrice;
  final double totalPrice;
  final String? coverLetter;
  final DateTime createdAt;

  PublicOrderApplicationModel({
    required this.applicationId,в
    required this.performerId,
    required this.performerNickname,
    this.performerAvatar,
    required this.bidPrice,
      createdAt: parseServerUtc(json['c_at']),
    );
  }
}