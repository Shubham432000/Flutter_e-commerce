import 'package:e_commerce/screens/cart.dart';
import 'package:e_commerce/screens/home_page.dart';
import 'package:e_commerce/screens/product_details.dart';
import 'package:e_commerce/screens/profile.dart';
import 'package:e_commerce/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/screens/login.dart';

class HomeBar extends StatefulWidget {
  final String name1;
  const HomeBar({super.key, required this.name1});
  static const IconData shopping_cart_checkout_rounded =
      IconData(0xf037e, fontFamily: 'MaterialIcons');
  @override
  State<HomeBar> createState() => _HomeBar();
}

List<dynamic> items1 = [];

class _HomeBar extends State<HomeBar> {
  // int _selectedIndex = 0;
  int _currentIndex = 0;
  // int cartQuantity = 0;

  void addToItem(product) {
    setState(() {
      items1.add(product);
    });
  }

  void removeProduct(removeId) {
    setState(() {
      items1.removeWhere((product) => product["id"] == removeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    var cartqnty = items1.length;
    setState(() {
      cartqnty;
    });
    final List<Widget> _screens = [
      HomePage(
        addToItem: addToItem,
      ),
      Cart(removeProduct: removeProduct),
      Profile(name2: widget.name1)
    ];
    return Scaffold(
      // appBar: AppBar(
      //     // title: const Text('BottomNavigationBar Sample'),
      //     ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          print("index $index");
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout_rounded),
            label: 'Cart ${cartqnty} ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
