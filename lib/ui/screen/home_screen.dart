// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp/ui/Restaurant/ratingstars.dart';
import 'package:myapp/ui/Food/recent_Food.dart';
import 'package:myapp/ui/auth/auth_screen.dart';
import 'package:myapp/ui/screen/restaurant_screen.dart';
import 'package:provider/provider.dart';
import '../../../ui/Restaurant/restaurant_manager.dart';
import '../auth/auth_manager.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int _selectedIndex = 0;
  // ignore: unused_element
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          iconSize: 30.0,
          onPressed: () {
            Navigator.of(context)
              ..pop()
              ..pushReplacementNamed('/');
            context.read<AuthManager>().logout();
          },
        ),
        title: const Text(
          'App Đặt Thức Ăn Nhanh',
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            iconSize: 30.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const cartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Tìm Kiếm Món Ăn',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      const BorderSide(width: 0.8, color: Colors.deepOrange),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      const BorderSide(width: 0.8, color: Colors.deepOrange),
                ),
                prefixIcon: const Icon(Icons.search, size: 30.0),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  iconSize: 30.0,
                  onPressed: () {},
                ),
              ),
            ),
          ),
          const NewFood(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Danh Sách Quán Ăn',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              _buildRestaurants(),
            ],
          ),
        ],
      ),
    );
  }

  _buildRestaurants() {
    List<Widget> restaurantList = [];
    for (var restaurant in RestaurantManager().restaurants) {
      restaurantList.add(GestureDetector(
          onTap: (() => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RestaurantScreen(restaurant: restaurant),
                ),
              )),
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1.0, color: Colors.grey),
            ),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    height: 150.0,
                    width: 150.0,
                    image: AssetImage(restaurant.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          restaurant.name,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        RaTingStars(restaurant.rating),
                        const SizedBox(height: 4.0),
                        const SizedBox(height: 4.0),
                        Text(
                          restaurant.address,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )));
    }
    return Column(
      children: restaurantList,
    );
  }
}
