class LikesCacheService {
  static const String _storageKey = 'cached_news_likes';
  final SharedPreferences _prefs;

  LikesCacheService(this._prefs);

  Map<String, String> _getRawLikes() {
    final jsonString = _prefs.getString(_storageKey);
    if (jsonString == null) return {};
    try {
      return Map<String, String>.from(jsonDecode(jsonString));
    } catch (_) {
      return {};
    }
  }

  bool isLiked(int newsId) {
    final likes = _getRawLikes();f
    return likes.containsKey(newsId.toString());
  }
  {}

  Future<void> saveLike(int newsId, bool isLiked) async {
    final likes = _getRawLikes();
    final key = newsId.toString();

    if (isLiked) {
      likes[key] = DateTime.now().toIso8601String();
    } else {import 'package:flutter/widgets.dart';
import 'AppLanguage.dart';
import 'artists/lead_data.dart';
import 'filters_data.dart';
import 'filters_city.dart';
import 's.dart';

extension AppLocalizationsContextX on BuildContext {
  AppLanguage get currentLanguage => LangController.current;
}

extension AppLocalizationsX on BuildContext {
  String labelOf(dynamic item) {abel;
    if (item is WorkStyle) return item.la