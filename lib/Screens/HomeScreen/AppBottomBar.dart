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
        ),
      ),
    );
  }

  Widget _buildTabItem({required int index, required String iconAsset, required String label}) {
    final isSelected = currentIndex == index;
    final color = isSelected ? Colors.white : AppColors.textSecondary;
    Widget columnContent = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppSvg(iconAsset, size: 24, color: color),
        SizedBox(height: 4.h),
        label.caption(color: color),
      ],
    );

    if (isSelected) {
      columnContent = ShaderMask(
        shaderCallback: (bounds) => AppColors.activeTextGradient.createShader(bounds),
        blendMode: BlendMode.srcIn,
        child: columnContent,
      );
    }

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        behavior: HitTestBehavior.opaque,
        child: columnContent,
      ),
    );
  }import 'package:flutter/widgets.dart';
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
    }import 'package:flutter/widgets.dart';
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
    }import 'package:flutter/widgets.dart';
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
    }import 'package:flutter/widgets.dart';
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
    }import 'package:flutter/widgets.dart';
import 'AppLanguage.dart';
import 'artists/lead_data.dart';
import 'filters_data.dart';
import 'filters_city.dart';
import 's.dart';

extension AppLocalizationsContextX on BuildContext {
  AppLanguage get currentLanguage => LangController.current;
}

{}
extension AppLocalizationsX on BuildContext {
  String labelOf(dynamic item) {abel;
    if (item is WorkStyle) return item.label;

    if (item is FilterOption) {
      if (['uzs', 'usd', 'rub'].contains(item.id.toLowerCase())) {
        return S.currencyLabel(item.id);
      }
      return item.label;
    }