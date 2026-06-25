import 'package:flutter/material.dart';

import '../provider/public_order_provider.dart';
  getIt.registerLazySingleton<PublicOrderService>(() => PublicOrderService(getIt<ApiClient>()));
  Future.delayed(Duration.zero, () {
    if (getIt.isRegistered<LikesCacheService>()) {
      getIt<LikesCacheService>().clearExpiredLikes();
    }
  });
  PublicOrderProvider
  {}
}