import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../ThemeData/ui_kit.dart';
import '../../../../l10n/artists/lead_data.dart';
import '../../../../l10n/s.dart';

class ProfileWorkStyleSelector extends StatelessWidget {
  final int? selectedStyleId;
  final bool isMcEnabled;
  final ValueChanged<int?> onStyleChanged;
  final ValueChanged<bool> onMcChanged;

  const ProfileWorkStyleSelector({super.key, required this.selectedStyleId, required this.isMcEnabled, required this.onStyleChanged, required this.onMcChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        S.styleMainTitle.h2(),
        SizedBox(height: 24.h),
        ...WorkStyle.values.map((style) => Padding(
          padding: EdgeInsets.only(bottom: 21.h),
          child: _StyleOptionTile(title: style.label, description: style.description, isSelected: selectedStyleId == style.id, onTap: () => onStyleChanged(style.id)),
        )),
        const Divider(color: AppColors.surfaceBorder),
        SizedBox(height: 21.h),
        _StyleOptionTile(title: S.styleMcTitle, description: S.styleMcDesc, isSelected: isMcEnabled, isCheckbox: true, onTap: () => onMcChanged(!isMcEnabled)),
      ],
    );
  }
}

class _StyleOptionTile extends StatelessWidget {
  final String title, description;
  final bool isSelected, isCheckbox;
  final VoidCallback onTap;

  const _StyleOptionTile({required this.title, required this.description, required this.isSelected, required this.onTap, this.isCheckbox = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, behavior: HitTestBehavior.opaque,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24.w, height: 24.w, margin: EdgeInsets.only(top: 2.h),
            decoration: BoxDecoration(
              shape: isCheckbox ? BoxShape.rectangle : BoxShape.circle,
              borderRadius: isCheckbox ? BorderRadius.circular(4.r) : null,
              border: Border.all(color: isSelected ? AppColors.accentEnd : (isCheckbox ? const Color(0xFFEBF2FF) : AppColors.accentEnd)),
            ),
            child: isSelected ? Center(
              child: Container(
                width: 10.w, height: 10.w,
                decoration: BoxDecoration(
                  shape: isCheckbox ? BoxShape.rectangle : BoxShape.circle,
                  borderRadius: isCheckbox ? BorderRadius.circular(2.r) : null,
                  gradient: AppColors.primaryGradient,
                ),
              ),
            ) : null,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title.body(weight: FontWeight.w600, size: 16.sp),
                SizedBox(height: 2.h),
                description.body(size: 12.sp, color: AppColors.textSecondary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}