class Food {
  final String? id;
  final String name;
  final String imageUrl;
  final double price;
  Food({
    this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });
  Food copyWith({
    String? id,
    String? name,
    String? imageUrl,
    double? price,
  }) {
    return Food(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  static Food fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'],
    );
  }
}
