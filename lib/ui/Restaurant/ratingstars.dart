import 'package:flutter/material.dart';

class RaTingStars extends StatelessWidget {
  final int rating;
  RaTingStars(this.rating);
  @override
  Widget build(BuildContext context) {
    String star = '';
    for (int i = 0; i < rating; i++) {
      star += '⭐ ';
    }
    star.trim();
    return Text(
      star,
      style: const TextStyle(fontSize: 18.0),
    );
  }
}
