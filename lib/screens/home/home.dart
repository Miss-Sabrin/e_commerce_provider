import 'dart:async';
import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:e_commerce_provider/provider/category_provider.dart';
import 'package:e_commerce_provider/provider/order_provider.dart';
import 'package:e_commerce_provider/provider/payment_provider.dart';
import 'package:e_commerce_provider/provider/product.dart';
import 'package:e_commerce_provider/provider/user.dart';
import 'package:e_commerce_provider/screens/category/category_view_page.dart';
import 'package:e_commerce_provider/widget/home_app_bar.dart';
import 'package:e_commerce_provider/widget/image_slider.dart';
import 'package:e_commerce_provider/widget/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AfterLayoutMixin {
  int currentSlide = 0;
  int selectedIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Provider.of<ProductProvider>(context, listen: false).fetchAllProducts();
  //     // Provider.of<ProductProvider>(context, listen: false)
  //     //     .fetchProductsByCategory('664ef1e847ebed68b6987f0f');
  //     Provider.of<CategoryProvider>(context, listen: false)
  //         .fetchAllCategories();
  //     Provider.of<OrderProvider>(context, listen: false)
  //         .fetchOrderByUser('664de1f8a2b39d6990d807e4');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: categoryProvider.state == CategoryState.loading
          ? const Center(child: CircularProgressIndicator())
          : categoryProvider.state == CategoryState.error
              ? const Center(child: Text("Error fetching categories"))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        //? => for custom appbar
                        const CusttomAppBar(),
                        const SizedBox(
                          height: 10,
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        //?: =>  Banner Board
                        ImageSlider(
                          currentSlide: currentSlide,
                          onChange: (value) {
                            setState(() {
                              currentSlide = value;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        //? => for categories
                        Column(
                          children: [
                            SizedBox(
                              // color: Colors.red,
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 0.1,
                                  childAspectRatio: 0.87,
                                ),
                                itemCount: categoryProvider.categories.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final category =
                                      categoryProvider.categories[index];
                                  return GestureDetector(
                                    onTap: () {
                                      String categoryId = category.id;
                                      productProvider
                                          .fetchProductsByCategory(categoryId);
                                      print('Category ID: ${category.id}');
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryViewPage(
                                            pageTitle: category.name,
                                          ),
                                        ),
                                      );
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      padding: const EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: selectedIndex == index
                                              ? Colors.blue[50]
                                              : Colors.transparent),
                                      child: Column(
                                        children: [
                                          Card(
                                            color: Colors.white,
                                            elevation: 10,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  14,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    category.photo,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            category.name,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Gap(20),

                            // Trending Section
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Trending 🔥',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  'see all',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black45),
                                )
                              ],
                            ),
                            //for shopping items
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20,
                                      childAspectRatio: 0.70),
                              itemCount: productProvider.products.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ProductCart(
                                    product: productProvider.products[index]);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    await userProvider.getUser();
    final userId = userProvider.user.id;
    Provider.of<ProductProvider>(context, listen: false).fetchAllProducts();
    Provider.of<CategoryProvider>(context, listen: false).fetchAllCategories();
    Provider.of<PaymentProvider>(context, listen: false).fetchAllPayments();
    // if (userId!.isNotEmpty) {
    //   log('User Id: $userId');
    //   Provider.of<OrderProvider>(context, listen: false)
    //       .fetchOrderByUser(userId);
    // }
  }
}
