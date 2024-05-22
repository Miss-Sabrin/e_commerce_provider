import 'package:e_commerce_provider/model/prodect_model.dart';
import 'package:e_commerce_provider/model/product.dart';
import 'package:e_commerce_provider/screens/constant.dart';
import 'package:e_commerce_provider/screens/detail/item_detail.dart';
import 'package:e_commerce_provider/screens/detail/widget_detail/add_to_cart.dart';
import 'package:e_commerce_provider/screens/detail/widget_detail/description.dart';
import 'package:e_commerce_provider/screens/detail/widget_detail/detail_app_bar.dart';
import 'package:e_commerce_provider/screens/detail/widget_detail/image_slider_detail.dart';
import 'package:flutter/material.dart';

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
                image: widget.product.photos![0],
                onChange: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  8,
                  (index) => AnimatedContainer(
                        duration: Duration(microseconds: 300),
                        width: currentSlide == index ? 15 : 8,
                        height: 8,
                        margin: EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentSlide == index
                                ? Colors.black
                                : Colors.transparent,
                            border: Border.all(color: Colors.black)),
                      )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //fro product name peice and rating and saller
                  // ItemDetails(product: widget.product),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'color',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Row(
                  //   children: List.generate(
                  //       widget.product.colors.length,
                  //       (index) => GestureDetector(
                  //             onTap: () {
                  //               setState(() {
                  //                 currentColor = index;
                  //               });
                  //             },
                  //             child: AnimatedContainer(
                  //               duration: Duration(milliseconds: 500),
                  //               width: 40,
                  //               height: 40,
                  //               decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   color: currentColor == index
                  //                       ? Colors.white
                  //                       : widget.product.colors[index],
                  //                   border: currentColor == index
                  //                       ? Border.all(
                  //                           color: widget.product.colors[index],
                  //                         )
                  //                       : null),
                  //               padding: currentColor == index
                  //                   ? const EdgeInsets.all(2)
                  //                   : null,
                  //               margin: EdgeInsets.only(right: 10),
                  //             ),
                  //           )),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  //for description
                  Description(text: widget.product.desc ?? ''),
                  SizedBox(
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
