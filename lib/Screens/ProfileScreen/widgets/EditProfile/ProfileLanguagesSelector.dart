import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../ThemeData/ui_kit.dart';
import '../../../../l10n/AppLanguage.dart';
import '../../../../l10n/app_localizations_x.dart';

class ProfileLanguagesSelector extends StatelessWidget {
  final String title;
  final String infoText;
  final List<String> selectedList;
  final List<AppLanguage> languages;
  final ValueChanged<List<String>> onLanguagesChanged;

  const ProfileLanguagesSelector({
    super.key, required this.title, required this.infoText,
    required this.selectedList, required this.languages, required this.onLanguagesChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoSection(title: title, tooltip: infoText),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.w,
            children: languages.map((lang) {
              final isSelected = selectedList.contains(lang.id);
              return _LanguageChip(
                label: context.labelOf(lang),
                isSelected: isSelected,
                onTap: () {
                  final updatedList = List<String>.from(selectedList);
                  if (updatedList.contains(lang.id)) {
                    if (updatedList.length > 1) updatedList.remove(lang.id);
                  } else {
                    updatedList.add(lang.id);
                  }
                  onLanguagesChanged(updatedList);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _LanguageChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageChip({required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        decoration: isSelected
            ? ShapeDecoration(gradient: AppColors.primaryGradient, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(88.r)))
            : ShapeDecoration(shape: RoundedRectangleBorder(side: const BorderSide(width: 1, color: AppColors.surfaceBorder), borderRadius: BorderRadius.circular(88.r))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            label.body(size: 14.sp, color: isSelected ? Colors.white : AppColors.textSecondary),
            if (isSelected) ...[
              SizedBox(width: 4.w),
              const Icon(Icons.close, size: 14, color: Colors.white),
            ]
          ],
        ),
      ),
    );
  }
}