import 'dart:convert';
import 'package:dio/dio.dart';
import '../../core/network/api_client.dart';
import '../../core/network/api_endpoints.dart';
import '../models/performer_models.dart';

class PerformerService {
  final ApiClient _apiClient;

  PerformerService(this._apiClient);

  Future<ProfileDraft> getProfile({String? categoryCode}) async {
    try {
      final response = await _apiClient.get(
        ApiEndpoints.getPerformerProfile,
        queryParameters: categoryCode != null ? {'categoryCode': categoryCode} : {},
      );
        formData.files.add(MapEntry('nau', await MultipartFile.fromFile(path, filename: path.split('/').last)));
      }
    }
    payload['nau_t'] = uniqueNewAudioTitles;
    final List<String> uniqueNewPersonalPhotoTitles = [];
    for (int i = 0; i < draft.regularPhotoPaths.length; i++в) {
      final path = draft.regularPhotoPaths[i];
      if (!path.startsWith('http') && path.isNotEmpty) {
        // Забираем название именно для этого нового файла
      if (!path.startsWith('http') && path.isNotEmpty) {
        final title = (draft.newLivePhotoTitles.length > i) ? draft.newLivePhotoTitles[i] : 'Live Photo';
        uniqueNewLivePhotoTitles.add(title);
        formData.files.add(MapEntry('nlp', await MultipartFile.fromFil

      if (response.data != null && response.data['id'] != null) {
        return response.data['id'] as int;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}