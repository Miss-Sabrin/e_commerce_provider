import 'package:e_commerce_provider/screens/cart/cart.dart';
import 'package:e_commerce_provider/screens/favorite/favorite.dart';
import 'package:e_commerce_provider/screens/home/home.dart';
import 'package:e_commerce_provider/screens/order/order_screen.dart';
import 'package:e_commerce_provider/screens/profile/profile.dart';
import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  final screens = [
    const Home(),
    const Favorite(),
    const CartScreen(),
    const OrderScreen(),
  ];
  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
