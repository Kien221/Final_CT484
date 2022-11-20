import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/cart_item.dart';
import 'CartManager.dart';

class CartItemCard extends StatelessWidget {
  final String FoodId;
  final CartItem cardItem;
  const CartItemCard({
    required this.FoodId,
    required this.cardItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cardItem.id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Are you sure?'),
            content:
                const Text('Do you want to remove the item from the cart?'),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        context.read<CartManager>().removeItem(FoodId);
      },
      child: buildItemCard(context),
    );
  }

  buildItemCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 100,
              height: 70,
              child: Image.asset(cardItem.imageUrl),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  cardItem.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Số Lượng: ${cardItem.quantity}',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 32, 27, 27),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      ' \$${cardItem.price}',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 200, 32, 32),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 50,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () {
                context.read<CartManager>().removeItem(FoodId);
              },
            ),
          ],
        ),
      ),
    );
  }
}
