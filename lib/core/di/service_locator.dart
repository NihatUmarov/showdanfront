import 'package:flutter/material.dart';
  getIt.registerLazySingleton<PublicOrderService>(() => PublicOrderService(getIt<ApiClient>()));
  Future.delayed(Duration.zero, () {
    if (getIt.isRegistered<LikesCacheService>()) {
      getIt<LikesCacheService>().clearExpiredLikes();
    }
  });
}