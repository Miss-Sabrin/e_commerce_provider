import 'package:e_commerce_provider/model/product.dart';
import 'package:e_commerce_provider/screens/constant.dart';
import 'package:e_commerce_provider/screens/detail/item_detail.dart';
import 'package:e_commerce_provider/screens/detail/widget_detail/add_to_cart.dart';
import 'package:e_commerce_provider/screens/detail/widget_detail/description.dart';
import 'package:e_commerce_provider/screens/detail/widget_detail/detail_app_bar.dart';
import 'package:e_commerce_provider/screens/detail/widget_detail/image_slider_detail.dart';
import 'package:flutter/material.dart';

import '../../model/product.dart';
import '../../model/product.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentIndex = 0;
  int currentSlide = 0;
  int currentColor = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: AddToCart(product: widget.product),
      backgroundColor: kcontentColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            //for back  button  share and fovarite
            DetailAppBar(
              product: widget.product,
            ),
            //for deatl image slider
            ImageSliderDetail(
                image: widget.product.photos!,
                onChange: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  8,
                  (index) => AnimatedContainer(
                        duration: const Duration(microseconds: 300),
                        width: currentSlide == index ? 15 : 8,
                        height: 8,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentSlide == index
                                ? Colors.black
                                : Colors.transparent,
                            border: Border.all(color: Colors.black)),
                      )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //fro product name peice and rating and saller
                  ItemDetails(product: widget.product),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'color',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: List.generate(
                        listOfColors.length,
                        (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentColor = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentColor == index
                                        ? Colors.white
                                        : listOfColors[index],
                                    border: currentColor == index
                                        ? Border.all(
                                            color: listOfColors[index],
                                          )
                                        : null),
                                padding: currentColor == index
                                    ? const EdgeInsets.all(2)
                                    : null,
                                margin: const EdgeInsets.only(right: 10),
                              ),
                            )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //for description
                  Description(text: widget.product.desc ?? ''),
                  const SizedBox(
                    height: 10,
                  ),

                  // AddToCart(product: widget.product)
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
