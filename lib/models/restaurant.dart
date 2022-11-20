import 'food.dart';

class Restaurant {
  final String? id;
  final String imgUrl;
  final String name;
  final String address;
  final int rating;
  final List<Food> menu;
  Restaurant({
    required this.id,
    required this.imgUrl,
    required this.name,
    required this.address,
    required this.rating,
    required this.menu,
  });
  Restaurant copyWith({
    String? id,
    String? imgUrl,
    String? name,
    String? address,
    int? rating,
    List<Food>? menu,
  }) {
    return Restaurant(
      id: id ?? this.id,
      imgUrl: imgUrl ?? this.imgUrl,
      name: name ?? this.name,
      address: address ?? this.address,
      rating: rating ?? this.rating,
      menu: menu ?? this.menu,
    );
  }
}
