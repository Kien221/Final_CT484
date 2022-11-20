import 'package:flutter/material.dart';
import 'package:myapp/ui/Food/Food_manager.dart';
import 'package:myapp/ui/auth/auth_manager.dart';
import 'package:myapp/ui/screen/User_Food_Screen.dart';
import 'package:myapp/ui/cart/CartManager.dart';
import 'package:myapp/ui/order/order_manage.dart';
import 'package:myapp/ui/screen/cart_screen.dart';
import 'package:myapp/ui/screen/editFood_Screen.dart';
import 'package:myapp/ui/screen/home_screen.dart';
import 'package:myapp/ui/screen/order_screen.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);
  static final List<Widget> _page = [
    const HomeScreen(),
    const cartScreen(),
    const OrderScreen(),
    const UserFoodScreen(),
  ];

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.deepOrange,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            backgroundColor: Colors.deepOrange,
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            backgroundColor: Colors.deepOrange,
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            backgroundColor: Colors.deepOrange,
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[300],
        onTap: _onItemTapped,
      ),
    );
  }
}
