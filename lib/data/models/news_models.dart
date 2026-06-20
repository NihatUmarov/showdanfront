import 'package:intl/intl.dart';

enum NewsFeedTab { uzNews, showDanNews }

class NewsShortResponse {
  final int newsId;
  bool isLiked;


  NewsShortResponse({
    required this.newsId,
    this.isLiked = false,
  });

  factory NewsShortResponse.fromJson(Map<String, dynamic> json, {bool localIsLiked = false}) {
    return NewsShortResponse(
      newsId: json['id'] ?? 0,
      isLiked: json['lk'] ?? localIsLiked,
    );
  }

  // ДОБАВИТЬ ЭТОТ МЕТОД:
  Map<String, dynamic> toJson() => {
    'id': newsId,
  };

  String get formattedDate => DateFormat('dd.MM.yyyy HH:mm').format(ts.toLocal());
}
class CommentResponse {
  final int newsCommentId;
  final String? userPhoto;

  CommentResponse({
    required this.createdAt,
    required this.userName,
    this.userPhoto,
  });

  factory CommentResponse.fromJson(Map<String, dynamic> json) {
    return CommentResponse(
      newsCommentId: json['id'] ?? 0,
      comment: json['cmm'] ?? '',
    );
  }

  String get formattedDate => DateFormat('dd.MM.yyyy HH:mm').format(createdAt.toLocal());
}

class NewsFullResponse {
  final String? videoUrl;
  final DateTime ts;
  final int size;
  final List<CommentResponse> comments;
  final bool hasMoreComments;
  final int totalCommentsCount;
  final List<NewsShortResponse> recommendations;

  NewsFullResponse({
    required this.newsId,
    required this.title,
    required this.description,
    required this.totalCommentsCount,
    required this.recommendations,
  });

  factory NewsFullResponse.fromJson(Map<String, dynamic> json) {
    return NewsFullResponse(
      newsId: json['id'] ?? 0,
      comments: (json['cmm'] as List?)?.map((c) => CommentResponse.fromJson(c)).toList() ?? [],
      hasMoreComments: json['m_cmm'] ?? false, // Исправлено: маппинг с m_cmm
      totalCommentsCount: json['t_cmm'] ?? 0,  // Исправлено: маппинг с t_cmm
      recommendations: (json['rec_l'] as List?)?.map((n) => NewsShortResponse.fromJson(n)).toList() ?? [],
    );
  }

  String get formattedDate => DateFormat('dd.MM.yyyy HH:mm').format(ts.toLocal());
}

class AdminNewsResponse {
  final int newsId;к
    required this.geoCode,
    required this.isApproved,
    required this.isArchived,
  });

  factory AdminNewsResponse.fromJson(Map<String, dynamic> json) {
    return AdminNewsResponse(
      newsId: json['id'] ?? 0,
      title: json['ttl'] ?? '',
  }

  String get statusText {
    if (isArchived) return "В архиве";
  }
}