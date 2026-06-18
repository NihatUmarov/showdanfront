import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../ThemeData/app_widgets.dart';
import '../../../../ThemeData/ui_kit.dart';
import '../../../../l10n/filters_data.dart';
import '../../../../l10n/app_localizations_x.dart';
import '../../../../l10n/s.dart';

class ProfileServicePackagesEditor extends StatelessWidget {
  final List<ServicePackage> services;
  final FilterOption? selectedCurrency;
  final VoidCallback onServiceAdded;
  final ValueChanged<int> onServiceRemoved;
  final VoidCallback onDurationChanged;

  const ProfileServicePackagesEditor({
    super.key, required this.services, required this.selectedCurrency,
    required this.onServiceAdded, required this.onServiceRemoved, required this.onDurationChanged,
  });

  @override
  Widget build(BuildContext context) {
    final double rowHeight = 50.w;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoSection(title: S.priceSectionTitle, tooltip: S.priceTooltip),
        SizedBox(height: 16.h),
        ...services.asMap().entries.map((entry) {
          final index = entry.key;
          final service = entry.value;
          final bool isFirst = index == 0;

          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80.w,
                  height: rowHeight,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.surfaceBorder),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isFirst) "1".body(weight: FontWeight.bold, size: 16.sp) else HoursPickerWidget(service: service, onSelectionChanged: onDurationChanged),
                      " ${S.hoursShort}".body(size: 14.sp, color: AppColors.textSecondary),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: CenteredMoneyInput(
                    label: '',
                    currency: selectedCurrency != null ? context.labelOf(selectedCurrency!) : '',
                    controller: service.priceController,
                    onChanged: (text) {
                      onDurationChanged();
                    },
                  ),
                ),
                if (!isFirst)
                  GestureDetector(
                    onTap: () => onServiceRemoved(index),
                    child: Container(
                      width: 40.w,
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.remove_circle_outline, color: AppColors.danger, size: 22.w),
                    ),
                  )
                else
                  SizedBox(width: 40.w),
              ],
            ),
          );
        }),
        if (services.length < 2)
          GestureDetector(
            onTap: onServiceAdded,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: const BoxDecoration(gradient: AppColors.primaryGradient, shape: BoxShape.circle),
                    child: const Icon(Icons.add, size: 16, color: Colors.white),
                  ),
                  SizedBox(width: 8.w),
                  S.addServiceBtn.body(size: 14.sp, color: Colors.white70),
                ],
              ),
            ),
          ),
        SizedBox(height: 20.h),
      ],
    );
  }
}