import 'package:flutter/material.dart';

import '../../models/cart_item.dart';
import '../../models/order.dart';

class OrdersManager with ChangeNotifier {
  final List<Order> _orders = [];
  int get orderCount {
    return _orders.length;
  }

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartfoods, double total) async {
    _orders.insert(
      0,
      Order(
        id: 'o${DateTime.now().toIso8601String()}',
        amount: total,
        foods: cartfoods,
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
