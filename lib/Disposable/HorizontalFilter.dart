import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../ThemeData/ui_kit.dart';
import '../l10n/filters_data.dart';

class HorizontalFilter extends StatelessWidget {
  final String label;

  static Widget list({
    required BuildContext context,
    required String? selectedId,
    required Function(FilterOption) onTap,
  }) {
    return SizedBox(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(
              weight: isSelected ? FontWeight.w600 : Fon
      ),
    );
  }
}