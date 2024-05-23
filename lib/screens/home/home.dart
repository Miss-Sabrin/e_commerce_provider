import 'package:e_commerce_provider/provider/category_provider.dart';
import 'package:e_commerce_provider/provider/product.dart';
import 'package:e_commerce_provider/widget/home_app_bar.dart';
import 'package:e_commerce_provider/widget/image_slider.dart';
import 'package:e_commerce_provider/widget/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentSlide = 0;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).fetchAllProducts();
      Provider.of<CategoryProvider>(context, listen: false)
          .fetchAllCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: categoryProvider.state == CategoryState.loading
          ? Center(child: CircularProgressIndicator())
          : categoryProvider.state == CategoryState.error
              ? Center(child: Text("Error fetching categories"))
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        //for custom appbar
                        CusttomAppBar(),
                        SizedBox(
                          height: 10,
                        ),

                        //for categories
                        SizedBox(
                          height: 240,
                          //color: Colors.white,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 0.1,
                                    childAspectRatio: 0.87),
                            itemCount: categoryProvider.categories.length,
                            itemBuilder: (BuildContext context, int index) {
                              final category =
                                  categoryProvider.categories[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
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
                                              7,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            //shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                category.photo,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          category.name,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        ///end category
                        ///image slider
                        SizedBox(
                          height: 10,
                        ),
                        ImageSlider(
                          currentSlide: currentSlide,
                          onChange: (value) {
                            setState(() {
                              currentSlide = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Buy Now',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w800),
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
                          physics: NeverScrollableScrollPhysics(),
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
                  ),
                ),
    );
  }
}
