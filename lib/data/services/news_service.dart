import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart'; // Необходим для MultipartFile и FormData
import '../../Screens/NewsScreen/likes_cache_service.dart';
import '../../core/network/api_client.dart';
import '../../core/network/api_endpoints.dart';
import '../models/news_models.dart';

class NewsService {
  final ApiClient _apiClient;
  final LikesCacheService _cacheService;

  NewsService(this._apiClient, this._cacheService);
      return NewsShortResponse.fromJson(item, localIsLiked: localLiked);
    }).toList();
  }Id, int start, int end) async {
    final response = await _apiClient.post(
      ApiEndpoints.newsCommentsList,
      data: {
        'id': newsId,
        's_l': start,
        'e_l': end,
      },
    );
    return (response.data as List).map((c) => CommentRespo
    // Исправлено: чтение сокращенного ключа 'lk' вместо старого 'liked'
    final bool serverLiked = response.data['lk'] ?? false;
    await _cacheService.saveLike(newsId, serverLiked);

    return serverLiked;
  }


  Future<List<AdminNewsResponse>> getAdminNewsList(int start, int end, String? geoCode) async {
    final response = await _apiClient.post(
      ApiEndpoints.newsAdminList,
      data: {
        's_l': start,
    required String titleOriginal,
    String? descOriginal,
    String? contentOriginal,
    required String langCode,
      'cnt': contentOriginal ?? '',
      'l_cd': langCode,
      'g_cd': geoCode,
      'sz': size,
      'vd': (videoUrl != null && videoUrl.isEmpty) ? null : videoUrl,
    };
        if (await file.exists()) {
          multipartFiles.add(
            await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
          );
        }
      }
    );в
    return true;
  }

  Future<bool> moderateNews(int newsId, String action) async {
    await _apiClient.post(
    return true;
  }
}