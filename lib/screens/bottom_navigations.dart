import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:e_commerce_provider/provider/navigation_provider.dart';
import 'package:e_commerce_provider/screens/cart/cart.dart';
import 'package:e_commerce_provider/screens/home/home.dart';
import 'package:e_commerce_provider/screens/order/order_screen.dart';
import 'package:e_commerce_provider/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

class BottomNvbar extends StatefulWidget {
  const BottomNvbar({super.key});

  @override
  State<BottomNvbar> createState() => _BottomNvbarState();
}

class _BottomNvbarState extends State<BottomNvbar> {
  List<Widget> screens = const [
    Home(),
    Profile(),
    CartScreen(),
    OrderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer<BottomNavProvider>(
        builder: (context, provider, child) {
          return Theme(
            data: ThemeData(
              navigationBarTheme: NavigationBarThemeData(
                backgroundColor: kcontentColor,
                indicatorColor: kprimarayColor,
                labelTextStyle: MaterialStateProperty.all(
                  const TextStyle(color: kMinCreamColor),
                ),
              ),
            ),
            child: NavigationBar(
              elevation: 0,
              height: 60,
              selectedIndex: provider.selectedIndex,
              onDestinationSelected: (index) =>
                  provider.setSelectedIndex(index),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Iconsax.home_1_copy),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.user),
                  label: 'Profile',
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.shop_copy),
                  label: 'Cart',
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.document_1_copy),
                  label: 'Orders',
                ),
              ],
            ),
          );
        },
      ),
      body: Consumer<BottomNavProvider>(builder: (context, provider, child) {
        return screens[provider.selectedIndex];
      }),
    );
  }
}
