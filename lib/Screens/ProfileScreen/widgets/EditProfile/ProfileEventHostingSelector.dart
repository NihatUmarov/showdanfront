import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../ThemeData/ui_kit.dart';
import '../../../../l10n/artists/lead_data.dart';
import '../../../../l10n/app_localizations_x.dart';
import '../../../../l10n/s.dart';

class ProfileEventHostingSelector extends StatefulWidget {
  final List<int> selectedKeys;
  final ValueChanged<List<int>> onChanged;

  const ProfileEventHostingSelector({super.key, required this.selectedKeys, required this.onChanged});

  @override
  State<ProfileEventHostingSelector> createState() => _ProfileEventHostingSelectorState();
}

class _ProfileEventHostingSelectorState extends State<ProfileEventHostingSelector> {
  final Set<EventGroup> _expandedGroups = {};

  void _toggleSection(EventGroup group) {
    setState(() => _expandedGroups.contains(group) ? _expandedGroups.remove(group) : _expandedGroups.add(group));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        InfoSection(title: S.eventsIHostTitle, tooltip: S.eventsIHostTooltip),
        SizedBox(height: 26.h),
        // ИСПРАВЛЕНО: ListView.builder с shrinkWrap заменен на чистый распакованный Column. Рендеринг в разы легче!
        Column(
          children: EventGroup.values.map((group) {
            final isExpanded = _expandedGroups.contains(group);
            final tags = EventTag.byGroup(group);
            return _buildEventSection(group, tags, isExpanded);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildEventSection(EventGroup group, List<EventTag> tags, bool isExpanded) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: isExpanded ? null : () => _toggleSection(group),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              children: [
                context.labelOf(group).body(size: 16.sp, weight: FontWeight.w500),
                const Spacer(),
                if (isExpanded)
                  TextButton(
                    onPressed: () {
                      final updated = List<int>.from(widget.selectedKeys);
                      for (var tag in tags) {
                        if (!updated.contains(tag.id)) updated.add(tag.id);
                      }
                      widget.onChanged(updated);
                    },
                    style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    child: S.selectAllButton.body(color: AppColors.textSecondary, size: 14.sp),
                  )
                else
                  const Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondary),
              ],
            ),
          ),
        ),
        if (isExpanded) ...[
          SizedBox(height: 8.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: tags.map((tag) {
              final isSelected = widget.selectedKeys.contains(tag.id);
              return GestureDetector(
                onTap: () {
                  final updated = List<int>.from(widget.selectedKeys);
                  isSelected ? updated.remove(tag.id) : updated.add(tag.id);
                  widget.onChanged(updated);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    gradient: isSelected ? AppColors.primaryGradient : null,
                    border: isSelected ? null : Border.all(color: AppColors.surfaceBorder),
                    borderRadius: BorderRadius.circular(88.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      tag.label.body(size: 14.sp, color: isSelected ? Colors.white : AppColors.textSecondary),
                      if (isSelected) ...[SizedBox(width: 4.w), const Icon(Icons.close, size: 14, color: Colors.white)]
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 8.h),
          GestureDetector(
            onTap: () => _toggleSection(group),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: const Row(mainAxisAlignment: MainAxisAlignment.end, children: [Icon(Icons.keyboard_arrow_up, color: AppColors.textSecondary)]),
            ),
          ),
        ],
        const Divider(color: AppColors.surfaceBorder),
      ],
    );
  }
}