import 'dart:async';
import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:e_commerce_provider/provider/banner_provider.dart';
import 'package:e_commerce_provider/provider/category_provider.dart';
import 'package:e_commerce_provider/provider/order_provider.dart';
import 'package:e_commerce_provider/provider/payment_provider.dart';
import 'package:e_commerce_provider/provider/product.dart';
import 'package:e_commerce_provider/provider/user.dart';
import 'package:e_commerce_provider/screens/category/category_view_page.dart';
import 'package:e_commerce_provider/utils/Delegates/custom_search.dart';
import 'package:e_commerce_provider/widget/custom_text_field.dart';
import 'package:e_commerce_provider/widget/home_app_bar.dart';
import 'package:e_commerce_provider/widget/image_slider.dart';
import 'package:e_commerce_provider/widget/product_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AfterLayoutMixin {
  int currentSlide = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: categoryProvider.state == CategoryState.loading
          ? _buildShimmerEffect()
          : categoryProvider.state == CategoryState.error
              ? const Center(child: Text("Error fetching categories"))
              : SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        SizedBox(
                          height: mediaQuery.height * 0.21,
                          width: mediaQuery.width * 0.99,
                          child: const CusttomAppBar(),
                        ),
                        const SizedBox(height: 10),
                        CusttomBanner(),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            SizedBox(
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
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryViewPage(
                                                  pageTitle: category.name),
                                        ),
                                      );
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          padding: const EdgeInsets.all(25),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: selectedIndex == index
                                                ? Colors.grey.shade200
                                                : Colors.grey.shade100,
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: category.photo,
                                            height: 25,
                                            width: 25,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            category.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(fontSize: 10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Gap(20),
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
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: GridView.builder(
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
                                  return ProductCard(
                                      product: productProvider.products[index]);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }

  Widget _buildShimmerEffect() {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: mediaQuery.height * 0.21,
              width: mediaQuery.width * 0.99,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                SizedBox(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 0.1,
                      childAspectRatio: 0.87,
                    ),
                    itemCount: 8, // Placeholder count
                    itemBuilder: (BuildContext context, int index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 5),
                            Container(
                              height: 10,
                              width: 50,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Gap(20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending 🔥',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'see all',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45),
                    ),
                  ],
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.70),
                  itemCount: 4, // Placeholder count
                  itemBuilder: (BuildContext context, int index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
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
    Provider.of<BannerProvider>(context, listen: false).getAllbanners();
  }
}
