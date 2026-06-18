import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../ThemeData/ui_kit.dart';
import '../../core/provider/calendar_provider.dart';
import '../../core/provider/sessioimport 'package:flutter/widgets.dart';
import 'AppLanguage.dart';
import 'artists/lead_data.dart';
import 'filters_data.dart';
import 'filters_city.dart';
import 's.dart';

extension AppLocalizationsContextX on Bimport 'package:flutter/widgets.dart';
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
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      FilterChip(
        label: Text("Весь день (выходной)",
            style: TextStyle(color: isAllDay ? Colors.white : AppColors.textSecondary, fontSize: 14.sp)),
        selected: isAllDay,
        onSelected: onAllDayChanged,
        backgroundColor: Colors.transparent,
        selectedColor: AppColors.accentPink.withValues(alpha: 0.18),
        shape: StadiumBorder(
            side: BorderSide(color: isAllDay ? AppColors.accentPink : Colors.white.withValues(alpha: 0.15))),
      ),
      if (!isAllDay) ...[
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1))),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: Column(children: [
                "С".body(color: AppColors.textSecondary, size: 13.sp),
                SizedBox(height: 4.h),
                HourWheelPicker(selectedHour: startHour, onHourChanged: onStartHourChanged)
              ]),
            ),
            Container(height: 60.h, width: 1, color: Colors.white.withValues(alpha: 0.15)),
            Expanded(
              child: Column(children: [
                "По".body(color: AppColors.textSecondary, size: 13.sp),
                SizedBox(height: 4.h),
                HourWheelPicker(selectedHour: endHour, onHourChanged: onEndHourChanged)
              ]),
            ),
          ]),
        ),
      ],
    ]);
  }
}

class BaseMonthCalendar extends StatelessWidget {
  final DateTime month;
  final bool showArrows;
  final VoidCallback? onPrevMonth;
  final VoidCallback? onNextMonth;
  final bool canGoPrev;
  final bool canGoNext;
  final bool isMovingNext;
  final Widget Function(BuildContext context, DateTime day) dayCellBuilder;

  const BaseMonthCalendar({
    super.key, required this.month, required this.dayCellBuilder, this.showArrows = false,
    this.onPrevMonth, this.onNextMonth, this.canGoPrev = true, this.canGoNext = true, this.isMovingNext = true,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final String monthName = DateFormat('LLLL yyyy', locale).format(month);
    final String formattedMonthName = monthName.substring(0, 1).toUpperCase() + monthName.substring(1);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeader(formattedMonthName),
        SizedBox(height: 12.h),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeOutCubic, switchOutCurve: Curves.easeInCubic,
          transitionBuilder: (Widget child, Animation<double> animation) {
            final isEntering = child.key == ValueKey(month);
            Offset beginOffset = isMovingNext
                ? (isEntering ? const Offset(0.15, 0.0) : const Offset(-0.15, 0.0))
                : (isEntering ? const Offset(-0.15, 0.0) : const Offset(0.15, 0.0));

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