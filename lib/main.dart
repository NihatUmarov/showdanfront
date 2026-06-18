import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:showdan/Screens/WelcomeScreen/InvasionScreen.dart';
import 'Screens/HomeScreen.dart';
import 'ThemeData/AppTheme.dart';
import 'l10n/AppLanguage.dart';
import 'core/provider/auth_provider.dart';
import 'core/provider/calendar_provider.dart';
import 'core/provider/orders_provider.dart';
import 'core/provider/session_provider.dart';
import 'core/provider/public_order_provider.dart';
import 'core/provider/news_provider.dart';
import 'core/provider/chat_provider.dart';
import 'core/storage/secure_storage.dart';
import 'core/di/service_locator.dart';
import 'data/services/public_order_service.dart';
import 'data/services/news_service.dart';
import 'data/services/chat_service.dart';
import 'data/services/availability_service.dart';
import 'data/services/order_service.dart';
import 'data/signal_r_service/chat_signal_r.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
}