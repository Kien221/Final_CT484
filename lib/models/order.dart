import 'package:myapp/models/cart_item.dart';

import 'food.dart';
import 'restaurant.dart';

class Order {
  final String? id;
  final double amount;
  final List<CartItem> foods;
  final DateTime date;
  Order({
    this.id,
    required this.amount,
    required this.foods,
    DateTime? date,
  }) : date = date ?? DateTime.now();

  get dateTime => null;

  Order copywith({
    String? id,
    int? quantity,
    double? amount,
    List<CartItem>? foods,
    DateTime? date,
  }) {
    return Order(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      foods: foods ?? this.foods,
      date: date ?? this.date,
    );
  }

  int get foodCount {
    return foods.length;
  }
}
