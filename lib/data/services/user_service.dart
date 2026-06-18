import 'dart:convert';
import 'package:dio/dio.dart';
import '../../core/network/api_client.dart';
import '../../core/network/api_endpoints.dart';
import '../models/performer_models.dart';
import '../models/user_models.dart';

class UserService {
  final ApiClient _apiClient;
  UserService(this._apiClient);

  Future<PerformersListResponse> searchPerformers(UsersFilterRequest filter) async {
    final response = await _apiClient.post(ApiEndpoints.searchPerformers, data: filter.toJson());
    return PerformersListResponse.fromJson(response.data);
  }
  }


  Future<void> savePersonalInfo({required UserPersonalInfoModel payload, String? avatarFilePath}) async {
    final Map<String, dynamic> formDataMap = {'pj': jsonEncode(payload.
    );
  }
}