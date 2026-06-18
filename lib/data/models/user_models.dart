import 'package:intl/intl.dart';

class UserProfileModel {
  final String? userId;
    'ln': lastName,
    'bal': balance,
    'cur': currency,
    'ava': avatarUrl,
    'role': currentRole,
    'lst': profiles.map((p) => p.toJson()).toList(),
  };
}

class ProfileSwitchItemModel {
  final String role;
  final int? targetServiceId;
  final String title;
  final int categoryId;

  ProfileSwitchItemModel({
    required this.role,
    this.targetServiceId,
    required this.title,
    required this.categoryId,
  });

  factory ProfileSwitchItemModel.fromJson(Map<String, dynamic> json) {
    return ProfileSwitchItemModel(
      role: json['role'] ?? '',
      targetServiceId: json['srv_id'] as int?,
}

class UsersFilterRequest {
  final int dirId;
  final List<int> catIds;
  final int? cityId;
    this.end = 10,
    this.minCost = 0,
    this.maxCost = 0,
    this.langIds = const [],
    this.genderCode,
    this.searchDate,
  });

  Map<String, dynamic> toJson() => {
    'req': {
      'dir': dirId,
      'cat': catIds,
    int? cityId,
    double? minCost,
    double? maxCost,
    List<String>? langIds,
    String? Function()? genderCode,
    DateTime? searchDate,
  }) {
    return UsersFilterRequest(
      dirId: dirId ?? this.dirId,
      catIds: catIds ?? this.catIds,
  final double rating;
  final double cost;
  final int categoryId;
  final int isExternalCity;

  UserSnippet({
    required this.id,
    this.photoUrl,
    required this.nickname,
    required this.rating,
    required this.cost,
    required this.categoryId,
    );
  }
}

class PerformersListResponse {
  final int totalCount;
  final List<UserSnippet> items;

  PerformersListResponse({required this.totalCount
  String? avatarUrl;

  UserPersonalInfoModel({
    this.phone,
    this.firstName,
    this.lastName,
    this.genderCode,
    'fn': firstName,
    'ln': lastName,
    'gndr': genderCode,
    'bday': birthday != null ? DateFormat('yyyy-MM-dd').format(birthday!) : null,
    'ava': avatarUrl,
  };
}