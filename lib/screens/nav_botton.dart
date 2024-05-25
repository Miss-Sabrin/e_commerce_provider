import 'package:e_commerce_provider/screens/cart/cart.dart';
import 'package:e_commerce_provider/screens/constant.dart';
import 'package:e_commerce_provider/screens/favorite/favorite.dart';
import 'package:e_commerce_provider/screens/home/home.dart';
import 'package:e_commerce_provider/screens/profile/profile.dart';
import 'package:flutter/material.dart';

class BottomNvbar extends StatefulWidget {
  const BottomNvbar({super.key});

  @override
  State<BottomNvbar> createState() => _BottomNvbarState();
}

class _BottomNvbarState extends State<BottomNvbar> {
  int cuttentIndex = 1;
  List screans = const [
    Scaffold(),
    Home(),
    CartScreen(),
    Favorite(),
    Profile(),
    Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            cuttentIndex = 1;
          });
        },
        shape: CircleBorder(),
        child:  Icon(
          Icons.home,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: kprimarayColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 14,
        height: 60,
        color: Colors.white60,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    cuttentIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.grid_view_outlined,
                  size: 30,
                  color:
                      cuttentIndex == 1 ? kprimarayColor : Colors.grey.shade400,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    cuttentIndex = 2;
                  });
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                  color:
                      cuttentIndex == 2 ? kprimarayColor : Colors.grey.shade400,
                )),
            SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    cuttentIndex = 3;
                  });
                },
                icon: Icon(
                  Icons.favorite_outline,
                  size: 30,
                  color:
                      cuttentIndex == 3 ? kprimarayColor : Colors.grey.shade400,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    cuttentIndex = 4;
                  });
                },
                icon: Icon(
                  Icons.person,
                  size: 30,
                  color:
                      cuttentIndex == 4 ? kprimarayColor : Colors.grey.shade400,
                ))
          ],
        ),
      ),
      body: screans[cuttentIndex],
    );
  }
}
