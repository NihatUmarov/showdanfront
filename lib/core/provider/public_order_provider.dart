import 'package:flutter/material.dart';
class PublicOrderProvider extends ChangeNotifier {
  final PublicOrderService _service;
  PublicOrderProvider(this._service);

  List<PublicOrderModel> feedOrders = [
    notifyListeners();
    try {
      myOrders = await _service.getMyPublicOrders();
    } catch (e) {
      debugPrint("Ошибка при загрузке моих заказов на бирже: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}