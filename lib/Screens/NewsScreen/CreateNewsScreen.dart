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
  String labelOf(dynamic item) {abel;f
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
    }