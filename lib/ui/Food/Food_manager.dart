import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import '../../models/auth_token.dart';
import '../../models/food.dart';
import '../../services/products_service.dart';

class FoodManagers with ChangeNotifier {
  List<Food> _foods = [
    Food(
      id: '1',
      name: 'Pizza',
      imageUrl: 'assets/images/pizza.jpg',
      price: 20,
    ),
    Food(
      id: '2',
      name: 'Burger',
      imageUrl: 'assets/images/burger.jpg',
      price: 23,
    ),
    Food(
      id: '3',
      name: 'Pasta',
      imageUrl: 'assets/images/pasta.jpg',
      price: 13,
    ),
    Food(
      id: '4',
      name: 'Salmon',
      imageUrl: 'assets/images/salmon.jpg',
      price: 11,
    ),
    Food(
      id: '5',
      name: 'remen',
      imageUrl: 'assets/images/ramen.jpg',
      price: 10,
    ),
    Food(
      id: '6',
      name: 'Steak',
      imageUrl: 'assets/images/steak.jpg',
      price: 15,
    ),
    Food(
      id: '7',
      name: 'Hotdog',
      imageUrl: 'assets/images/pancakes.jpg',
      price: 12,
    ),
    Food(
      id: '8',
      name: 'Chân Gà Sả Ớt',
      imageUrl: 'assets/images/changa.jpg',
      price: 12,
    ),
    Food(
      id: '9',
      name: 'Phô Mai Que',
      imageUrl: 'assets/images/phomaique.jpg',
      price: 12,
    ),
    Food(
      id: '10',
      name: 'Bánh Tráng Trộn',
      imageUrl: 'assets/images/banhtrangtron.jpg',
      price: 12,
    ),
  ];
  final ProductsService _productsService;
  FoodManagers([AuthToken? authToken])
      : _productsService = ProductsService(authToken);

  set authToken(AuthToken? authToken) {
    _productsService.authToken = authToken;
  }

  int get itemCount {
    return _foods.length;
  }

  List<Food> get foods => [..._foods];

  Future<void> fetchProducts([bool filterByUser = false]) async {
    _foods = await _productsService.fetchProducts(filterByUser);
    notifyListeners();
  }

  Future<void> addProduct(Food food) async {
    final newProduct = await _productsService.addProduct(food);
    if (newProduct != null) {
      _foods.add(newProduct);
      notifyListeners();
    }
  }

  Future<void> updateProduct(Food food) async {
    final index = _foods.indexWhere((item) => item.id == food.id);
    if (index >= 0) {
      if (await _productsService.updateProduct(food)) {
        _foods[index] = food;
        notifyListeners();
      }
    }
  }

  Future<void> deleteProduct(String id) async {
    final index = _foods.indexWhere((item) => item.id == id);
    Food? existingProduct = _foods[index];
    _foods.removeAt(index);
    notifyListeners();

    if (!await _productsService.deleteProduct(id)) {
      _foods.insert(index, existingProduct);
      notifyListeners();
    }
  }

  Food findById(String id) {
    return _foods.firstWhere((prod) => prod.id == id);
  }
}
