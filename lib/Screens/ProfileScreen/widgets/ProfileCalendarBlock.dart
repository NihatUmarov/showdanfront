import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../ThemeData/ui_kit.dart';
import '../../../core/provider/calendar_provider.dart';
import '../../../data/models/availability_model.dart';
import '../../../l10n/app_localizations_x.dart';
import '../../../l10n/s.dart';
import '../../../widgets/BottomSheetApp.dart';
import '../../Availability/CalendarWidgets.dart';
import '../OrderScreen.dart';

class ProfileCalendarBlock extends StatefulWidget {
  final int serviceId;
  const ProfileCalendarBlock({super.key, required this.serviceId});

  @override
  State<ProfileCalendarBlock> createState() => _ProfileCalendarBlockState();
}

class _ProfileCalendarBlockState extends State<ProfileCalendarBlock> {
  DateTime _selectedDate = DateTime.now();
  late final DateTime _todayMidnight;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _todayMidnight = DateTime(now.year, now.month, now.day);
  }

  void _showDayEventsBottomSheet(BuildContext context, DateTime date, List<AvailabilityModel> events) {
    final bool isPast = date.isBefore(_todayMidnight);
    final calendarProvider = context.read<CalendarProvider>();
    final locale = Localizations.localeOf(context).languageCode;
    final timeFormat = DateFormat('HH:mm', locale);
    final formattedDateText = DateFormat('dd MMMM yyyy', locale).format(date);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) {
        return BottomSheetShell(
          header: "Расписание на $formattedDateText".h2(),
          content: events.isEmpty
              ? Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(color: Colors.green.withValues(alpha: 0.1), shape: BoxShape.circle),
                    child: const Icon(Icons.calendar_today_rounded, color: Colors.green, size: 32),
                  ),
                  SizedBox(height: 16.h),
                  S.artistFullyFree.body(color: Colors.green, size: 15, weight: FontWeight.w600),
                ],
              ),
            ),
          )
              : Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(events.length, (index) {
              final event = events[index];
              final Color statusColor = event.status.color == Colors.transparent ? AppColors.textSecondary : event.status.color;
              final String displayTitle = (event.clientName != null && event.clientName!.isNotEmpty) ? event.clientName! : event.status.defaultTitle;

              return Container(
                margin: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.03), borderRadius: BorderRadius.circular(14.r)),
                clipBehavior: Clip.antiAlias,
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Container(width: 4.w, color: statusColor),
                      SizedBox(width: 14.w),
                      if (event.userPhotoUrl != null && event.userPhotoUrl!.isNotEmpty) ...[
                        AppImg(event.userPhotoUrl!, width: 36, height: 36, radius: 18),
                        SizedBox(width: 12.w),
                      ],
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              displayTitle.body(weight: FontWeight.w600, maxLines: 1),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  const Icon(Icons.access_time_rounded, size: 14, color: Colors.white38),
                                  SizedBox(width: 4.w),
                                  "${timeFormat.format(event.startTimeUtc.toLocal())} — ${timeFormat.format(event.endTimeUtc.toLocal())}".body(color: Colors.white54, size: 12, weight: FontWeight.w500),
                                  if (event.cityCode != null) ...[
                                    SizedBox(width: 12.w),
                                    const Icon(Icons.location_on_outlined, size: 14, color: Color(0xFFFF9500)),
                                    SizedBox(width: 2.w),
                                    context.cityLabelFromId(event.cityCode).body(size: 12, color: Colors.white54),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          footer: isPast ? null : Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: AppBtn(
              "Пригласить на этот день",
              onPressed: () {
                Navigator.pop(modalContext);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider.value(
                      value: calendarProvider,
                      child: OrderScreen(serviceId: widget.serviceId, initialDate: date),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        S.artistCalendarTitle.body(size: 16, weight: FontWeight.w600),
        SizedBox(height: 16.h),
        InteractiveMonthCalendar(
          selectedDate: _selectedDate,
          showEventsOnPastDays: false,
          onDayTap: (currentDay) {
            setState(() => _selectedDate = currentDay);

            final provider = context.read<CalendarProvider>();
            final bool isPast = currentDay.isBefore(_todayMidnight);
            final events = isPast ? <AvailabilityModel>[] : provider.getEventsForDay(currentDay);

            _showDayEventsBottomSheet(context, currentDay, events);
          },
        ),
      ],
    );
  }
}