import 'package:flutter/material.dart';
import 'package:myapp/ui/Food/Food_manager.dart';
import 'package:provider/provider.dart';

import '../../models/food.dart';

class UserFoodListTile extends StatelessWidget {
  const UserFoodListTile(
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
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/edit-food', arguments: food.id);
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                context.read<FoodManagers>().deleteProduct(food.id!);
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Đã Xóa Sản Phẩm',
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
