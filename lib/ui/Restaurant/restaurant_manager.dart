import 'package:flutter/foundation.dart';
import '../../models/food.dart';
import '../../models/restaurant.dart';

class RestaurantManager with ChangeNotifier {
  final List<Restaurant> _restaurants = [
    Restaurant(
        id: '1',
        imgUrl: 'assets/images/quan1.jpg',
        name: '6 Hiền',
        address: '30/4,Ninh Kiều, Cần Thơ',
        rating: 5,
        menu: [
          Food(
            id: '1',
            name: 'Pizza',
            imageUrl: 'assets/images/pizza.jpg',
            price: 14,
          ),
          Food(
            id: '2',
            name: 'Burger',
            imageUrl: 'assets/images/burger.jpg',
            price: 7,
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
            id: '8',
            name: 'Chân Gà Sả Ớt',
            imageUrl: 'assets/images/changa.jpg',
            price: 12,
          ),
          Food(
            id: '9',
            name: 'Pho Mai Que',
            imageUrl: 'assets/images/phomaique.jpg',
            price: 12,
          ),
          Food(
            id: '10',
            name: 'Bánh Tráng Trộn',
            imageUrl: 'assets/images/banhtrangtron.jpg',
            price: 12,
          ),
        ]),
    Restaurant(
        id: '2',
        imgUrl: 'assets/images/quan2.jpg',
        name: 'Tiểu Lô Tô',
        address: '30/4,Ninh Kiều, Cần Thơ',
        rating: 4,
        menu: [
          Food(
            id: '5',
            name: 'remen',
            imageUrl: 'assets/images/ramen.jpg',
            price: 10,
          ),
          Food(
            id: '8',
            name: 'Chân Gà Sả Ớt',
            imageUrl: 'assets/images/changa.jpg',
            price: 12,
          ),
          Food(
            id: '9',
            name: 'Pho Mai Que',
            imageUrl: 'assets/images/phomaique.jpg',
            price: 12,
          ),
          Food(
            id: '10',
            name: 'Bánh Tráng Trộn',
            imageUrl: 'assets/images/banhtrangtron.jpg',
            price: 12,
          ),
        ]),
    Restaurant(
        id: '3',
        imgUrl: 'assets/images/restaurant2.jpg',
        name: 'Gà Xiên Que Xe Lửa',
        address: 'Cách mạng tháng 8,Ninh Kiều, Cần Thơ',
        rating: 5,
        menu: [
          Food(
            id: '5',
            name: 'remen',
            imageUrl: 'assets/images/pasta.jpg',
            price: 9,
          ),
          Food(
            id: '8',
            name: 'Chân Gà Sả Ớt',
            imageUrl: 'assets/images/changa.jpg',
            price: 12,
          ),
          Food(
            id: '9',
            name: 'Pho Mai Que',
            imageUrl: 'assets/images/phomaique.jpg',
            price: 12,
          ),
          Food(
            id: '10',
            name: 'Bánh Tráng Trộn',
            imageUrl: 'assets/images/banhtrangtron.jpg',
            price: 12,
          ),
        ])
  ];
  int get itemCount {
    return _restaurants.length;
  }

  List<Restaurant> get restaurants {
    return [..._restaurants];
  }

  Restaurant findById(String id) {
    return _restaurants.firstWhere((element) => element.id == id);
  }

  Future<void> addFoodRestaurant(Food food) async {
    final newFood = Food(
      id: DateTime.now().toString(),
      name: food.name,
      imageUrl: food.imageUrl,
      price: food.price,
    );
    _restaurants[0].menu.add(newFood);
    notifyListeners();
  }
}
