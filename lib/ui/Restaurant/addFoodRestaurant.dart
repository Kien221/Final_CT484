import 'package:flutter/material.dart';
import 'package:myapp/ui/Restaurant/listFood.dart';
import 'package:provider/provider.dart';
import '../Food/Food_manager.dart';

class AddFoodRestaurant extends StatelessWidget {
  static const routeName = '/addFoodRestaurant';
  Future<void> _refreshProducts(BuildContext context) async {
    await context.read<FoodManagers>().fetchProducts();
  }

  const AddFoodRestaurant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productsData = context.watch<FoodManagers>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh Sách Món Ăn'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productsData.itemCount,
            itemBuilder: (ctx, i) => Column(
              children: <Widget>[
                ListFood(
                  productsData.foods[i],
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
