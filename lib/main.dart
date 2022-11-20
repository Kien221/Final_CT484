import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:myapp/models/restaurant.dart';
import 'package:myapp/ui/Food/Food_manager.dart';
import 'package:myapp/ui/Restaurant/addFoodRestaurant.dart';
import 'package:myapp/ui/Restaurant/restaurant_manager.dart';
import 'package:myapp/ui/auth/auth_manager.dart';
import 'package:myapp/ui/auth/auth_screen.dart';
import 'package:myapp/ui/screen/User_Food_Screen.dart';
import 'package:myapp/ui/cart/CartManager.dart';
import 'package:myapp/ui/order/order_manage.dart';
import 'package:myapp/ui/screen/cart_screen.dart';
import 'package:myapp/ui/screen/editFood_Screen.dart';
import 'package:myapp/ui/screen/home_screen.dart';
import 'package:myapp/ui/screen/order_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const Food_Delivery_App());
}

// ignore: camel_case_types
class Food_Delivery_App extends StatefulWidget {
  const Food_Delivery_App({Key? key}) : super(key: key);
  static final List<Widget> _page = [
    const HomeScreen(),
    const cartScreen(),
    const OrderScreen(),
    const UserFoodScreen(),
  ];

  @override
  State<Food_Delivery_App> createState() => Food_Delivery_AppState();
}

// ignore: camel_case_types
class Food_Delivery_AppState extends State<Food_Delivery_App> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthManager()),
          ChangeNotifierProxyProvider<AuthManager, FoodManagers>(
            create: (ctx) => FoodManagers(),
            update: (ctx, authManager, productsManager) {
              productsManager!.authToken = authManager.authToken;
              return productsManager;
            },
          ),
          ChangeNotifierProvider(create: (context) => CartManager()),
          ChangeNotifierProvider(create: (context) => OrdersManager()),
          ChangeNotifierProvider(create: (context) => RestaurantManager())
        ],
        child: Consumer<AuthManager>(builder: (context, authManager, child) {
          return MaterialApp(
            title: 'Food Delivery App',
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
            ),
            home: authManager.isAuth
                ? Scaffold(
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
                    body: Food_Delivery_App._page[_selectedIndex],
                  )
                : const AuthScreen(),
            routes: {
              AddFoodRestaurant.routeName: (context) =>
                  const AddFoodRestaurant(),
            },
            onGenerateRoute: (settings) {
              if (settings.name == EditFoodScreen.routeName) {
                final productId = settings.arguments as String?;
                return MaterialPageRoute(
                  builder: (ctx) {
                    return EditFoodScreen(
                      productId != null
                          ? ctx.read<FoodManagers>().findById(productId)
                          : null,
                    );
                  },
                );
              }
              return null;
            },
            debugShowCheckedModeBanner: false,
          );
        }));
  }
}
