import 'package:flutter/material.dart';
import '../../models/cart_item.dart';
import '../../models/food.dart';

class CartManager with ChangeNotifier {
  Map<String, CartItem> _items = {};
  // ignore: non_constant_identifier_names
  int get FoodCount {
    return _items.length;
  }

  Iterable<MapEntry<String, CartItem>> get foodEntries {
    return {..._items}.entries;
  }

  List<CartItem> get foods {
    return _items.values.toList();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(Food food) {
    if (_items.containsKey(food.id)) {
      _items.update(
        food.id!,
        (existingCartItem) => existingCartItem.copyWith(
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        food.id!,
        () => CartItem(
          id: food.id,
          title: food.name,
          price: food.price,
          imageUrl: food.imageUrl,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String foodId) {
    _items.remove(foodId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
