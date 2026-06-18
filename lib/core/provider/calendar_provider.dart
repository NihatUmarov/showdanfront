import 'package:flutter/material.dart';
import '../../data/models/availability_model.dart';
import '../../data/services/availability_service.dart';
import '../../data/services/order_service.dart';
import '../../data/models/order_models.dart';

class CalendarProvider extends ChangeNotifier {

      final existingIds = _events.map((e) => e.id).toSet();
      final List<AvailabilityModel> updatedList = List.from(_events);

      for (var e in fetchedEvents) {
        if (!existingIds.contains(e.id)) {
          updatedList.add(e);
        }
      }

      _events = updatedList;

      final prevMonthObj = DateTime(targetMonth.year, targetMonth.month - 1, 1);
      final nextMonthObj = DateTime(targ
    }
  }

  Future<bool> cancelOrder(int orderId, String reason) async {
    try {
      await _orderService.cancelOrder(CancelOrderRequestDto(orderId: orderId, reason: reason));
      await _refreshCacheInBackground();
      return true;
  void nextMonth() => shiftMonth(true);
  void prevMonth() => shiftMonth(false);
}