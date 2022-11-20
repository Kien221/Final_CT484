import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Food/Food_manager.dart';
import '../Food/userFoodListTitle.dart';
import 'editFood_Screen.dart';

class UserFoodScreen extends StatelessWidget {
  const UserFoodScreen({super.key});
  Future<void> _refreshProducts(BuildContext context) async {
    await context.read<FoodManagers>().fetchProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Danh Sách Món Ăn'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(EditFoodScreen.routeName);
              },
            ),
          ],
        ),
        body: FutureBuilder(
          future: _refreshProducts(context),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return RefreshIndicator(
              onRefresh: () => _refreshProducts(context),
              child: buildUserProductListView(),
            );
          },
        ));
  }

  Widget buildUserProductListView() {
    return Consumer<FoodManagers>(
      builder: (ctx, productsManager, child) {
        return ListView.builder(
          itemCount: productsManager.itemCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              UserFoodListTile(
                productsManager.foods[i],
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
