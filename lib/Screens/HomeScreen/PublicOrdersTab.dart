import 'package:flutter/widgets.dart';
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
    if (item is WorkStyle) return item.label;

    if (item is FilterOption) {
      if (['uzs', 'usd', 'rub'].contains(item.id.toLowerCase())) {
        return S.currencyLabel(item.id);
      }
      return item.label;
    }
          onRefresh: () async => _refreshData(),
          child: provider.isLoading && orders.isEmpty
              ? const Center(child: CircularProgressIndicator(color: AppColors.accentPink))
              : orders.isEmpty
              ? _buildEmptyState()
              : ListView.separated(
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, isClient ? 80.h : 16.h),
            physics: const AlwaysScrollableScrollPhysics(), itemCount: orders.length,
            separatorBuilder: (_, __) => SizedBox(height: 12.h),
            itemBuilder: (context, index) import 'package:flutter/widgets.dart';
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
    if (item is WorkStyle) return item.label;

    if (item is FilterOption) {
      if (['uzs', 'usd', 'rub'].contains(item.id.toLowerCase())) {
        return S.currencyLabel(item.id);
      }
      return item.label;
    }f