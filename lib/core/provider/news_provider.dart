import 'dart:convert';
import 'package:flutter/material.dart';
class NewsProvider extends ChangeNotifier {
  final NewsService _newsService;
  final SecureStorage _storage;


  List<NewsShortResponse> _newsItems = [];
  NewsFeedTab get selectedTab => _selectedTab;

  bool get isInitialLoading => !_hasFetchedOnce && _newsItems.isEmpty && _isSilentLoading;

  Future<void> _loadFromDisk() async {

    }
  }

  void changeTab(NewsFeedTab tab) async {
    if (_selectedTab == tab) return;

    await fetchNews();
  }

  Future<bool> _isCacheExpired() async {

    final difference = DateTime.now().difference(lastFetchedTime);
    return difference.inHours >= 24;
  }

  Future<void> fetchNews({bool forceRefresh = false}) async {


    try {
      final String geoCode = _selectedTab == NewsFeedTab.showDanNews ? "showdan" : "UZ";
      final response = await _newsService.getNewsList(geoCode);
      _newsItems = response;
      _hasFetchedOnce = tru
    }
  }

  Future<void> handleLanguageChange() async {
    _newsItems = [];
  }
}