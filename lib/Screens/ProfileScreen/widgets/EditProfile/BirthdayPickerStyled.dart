import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../ThemeData/ui_kit.dart';
import '../../../../l10n/s.dart';

class BirthdayPickerStyled extends StatefulWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime> onDateChanged;

  const BirthdayPickerStyled({super.key, this.initialDate, required this.onDateChanged});

  @override
  State<BirthdayPickerStyled> createState() => _BirthdayPickerStyledState();
}

class _BirthdayPickerStyledState extends State<BirthdayPickerStyled> {
  late FixedExtentScrollController _dayController, _monthController, _yearController;
  static const startYear = 1970;
  late DateTime _currentDate;

  @override
  void initState() {
    super.initState();
    _currentDate = widget.initialDate ?? DateTime(1993, 7, 7);
    _dayController = FixedExtentScrollController(initialItem: _currentDate.day - 1);
    _monthController = FixedExtentScrollController(initialItem: _currentDate.month - 1);
    _yearController = FixedExtentScrollController(initialItem: _currentDate.year - startYear);
  }

  @override
  void didUpdateWidget(covariant BirthdayPickerStyled oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialDate != null && widget.initialDate != _currentDate) {
      _currentDate = widget.initialDate!;
      _animateToCurrentDate();
    }
  }

  void _animateToCurrentDate() {
    if (_dayController.hasClients) _dayController.jumpToItem(_currentDate.day - 1);
    if (_monthController.hasClients) _monthController.jumpToItem(_currentDate.month - 1);
    if (_yearController.hasClients) _yearController.jumpToItem(_currentDate.year - startYear);
  }

  @override
  void dispose() {
    _dayController.dispose(); _monthController.dispose(); _yearController.dispose();
    super.dispose();
  }

  void _updateDate({int? day, int? month, int? year}) {
    final tYear = year ?? _currentDate.year;
    final tMonth = month ?? _currentDate.month;
    final maxDays = DateTime(tYear, tMonth + 1, 0).day;
    final tDay = (day ?? _currentDate.day).clamp(1, maxDays);

    _currentDate = DateTime(tYear, tMonth, tDay);
    widget.onDateChanged(_currentDate);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    final int daysCount = DateTime(_currentDate.year, _currentDate.month + 1, 0).day;
    final String formattedDate = "${_currentDate.day.toString().padLeft(2, '0')}.${_currentDate.month.toString().padLeft(2, '0')}.${_currentDate.year}";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        S.birthdayTitle.body(size: 20.sp, weight: FontWeight.w500), // ИСПРАВЛЕНО: strictly .sp
        SizedBox(height: 24.h),
        AspectRatio(
          aspectRatio: 343 / 140,
          child: Row(
            children: [
              _buildWheel(S.dayLabel, daysCount, 1, _currentDate.day - 1, _dayController, (i) => _updateDate(day: i + 1)),
              _buildWheel(S.monthLabel, 12, 1, _currentDate.month - 1, _monthController, (i) => _updateDate(month: i + 1)),
              _buildWheel(S.yearLabel, (currentYear - startYear) + 1, startYear, _currentDate.year - startYear, _yearController, (i) => _updateDate(year: startYear + i)),
            ],
          ),
        ),
        SizedBox(height: 24.h),
        Center(child: formattedDate.body(size: 22.sp, color: AppColors.textPrimary)),
      ],
    );
  }

  Widget _buildWheel(String label, int count, int start, int current, FixedExtentScrollController ctrl, ValueChanged<int> onChange) {
    return Expanded(
      child: Row(
        children: [
          label.body(size: 16.sp),
          Expanded(
            child: ListWheelScrollView.useDelegate(
              controller: ctrl, itemExtent: 44.h, onSelectedItemChanged: onChange,
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: count,
                builder: (_, index) {
                  final val = start + index;
                  final isSelected = index == current;
                  return Center(
                    child: (start > 12 ? val.toString() : val.toString().padLeft(2, '0')).body(
                      size: isSelected ? 26.sp : 18.sp,
                      color: isSelected ? AppColors.textPrimary : Colors.white24,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}