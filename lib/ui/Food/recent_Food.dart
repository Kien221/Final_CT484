// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:myapp/ui/cart/CartManager.dart';
import 'package:provider/provider.dart';
import '../../models/food.dart';
import 'Food_manager.dart';
import '../Restaurant/restaurant_manager.dart';

class NewFood extends StatelessWidget {
  const NewFood({Key? key}) : super(key: key);
  Future<void> _refreshProducts(BuildContext context) async {
    await context.read<FoodManagers>().fetchProducts(true);
  }

  _buiderRecentFood(BuildContext context, Food food) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(width: 1.0, color: Colors.grey[200]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  height: 100,
                  width: 100,
                  image: AssetImage(food.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ]),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    food.name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    ' \$${food.price}',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            width: 48.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IconButton(
              icon: Icon(Icons.add),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {
                final cart = context.read<CartManager>();
                cart.addItem(food);
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: const Text(
                        'Đã thêm món ăn vào giỏ hàng',
                      ),
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'ẨN',
                        onPressed: () {
                          cart.removeItem(food.id!);
                        },
                      ),
                    ),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _foodManager = FoodManagers();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Món Ăn Mới Nhất',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          height: 130.0,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: _foodManager.itemCount,
              itemBuilder: (BuildContext context, int index) {
                final food = _foodManager.foods[index];
                return _buiderRecentFood(context, food);
              }),
        ),
      ],
    );
  }
}
