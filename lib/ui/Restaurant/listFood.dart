import 'package:flutter/material.dart';
import 'package:myapp/ui/Restaurant/restaurant_manager.dart';
import 'package:provider/provider.dart';

import '../../models/food.dart';
import '../../models/restaurant.dart';
import '../Food/Food_manager.dart';

class ListFood extends StatelessWidget {
  const ListFood(
    this.food, {
    super.key,
  });

  final Food food;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(food.name),
      leading: CircleAvatar(
        child: Image.asset(food.imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                context.read<RestaurantManager>().addFoodRestaurant(food);
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Đã Thêm Sản Phẩm',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
              },
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
