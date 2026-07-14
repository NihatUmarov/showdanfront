class AppException implements Exception {
  final String message;
  AppException(this.message);

  @override
  String toString() => message;
}ySingleton<PublicOrderService>(() => PublicOrderService(getIt<ApiClient>()));
  Future.delayed(Duration.zero, () {
    if (getIt.isRegistered<LikesCacheService>()) {
      getIt<LikesCacheService>().clearExpiredLikes();
    }
  });ySingleton<PublicOrderService>(() => PublicOrderService(getIt<ApiClient>()));
  Future.delayed(Duration.zero, () {
    if (getIt.isRegistered<LikesCacheService>()) {
      getIt<LikesCacheService>().clearExpiredLikes();
    }
  });