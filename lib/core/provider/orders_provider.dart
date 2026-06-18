import 'package:flutter/material.dart';
class OrdersProvider extends ChangeNotifier {
  List<OrderShortResponseDto> _orders = [];
  bool _isOrdersLoading = false;

  List<OrderShortResponseDto> get orders => _orders;
  bool get isOrdersLoading => _isOrdersLoading;

  Future<void> fetchOrders({bool isHistory = false, int offset = 0, int limit = 20}) async {
   
    } finally {
      _isOrdersLoading = false;
      notifyListeners();
    }
  }

}