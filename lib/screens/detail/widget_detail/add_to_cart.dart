import 'dart:developer';

import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:e_commerce_provider/model/prodect_model.dart';
import 'package:e_commerce_provider/model/product.dart';
import 'package:e_commerce_provider/provider/cart_peovider.dart';

import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  Product product;
  AddToCart({super.key, required this.product});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    //todo provider
    final provider = CartProvider.of(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kcontentColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          alignment: Alignment.center,
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       height: 40,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(20),
          //           border: Border.all(color: Colors.white)
          //           //color: Colors.white,
          //           ),
          //       child: Container(
          //         height: 55,
          //         decoration: BoxDecoration(
          //             color: kprimarayColor,
          //             borderRadius: BorderRadius.circular(20)),
          //         child:
          //          Row(
          //           children: [
          //             IconButton(
          //               onPressed: () {
          //                 //todo remove icon
          //                 if (currentIndex != 1) {
          //                   setState(() {
          //                     currentIndex--;
          //                   });
          //                 }
          //               },
          //               icon: const Icon(
          //                 Icons.remove,
          //                 color: Colors.white,
          //               ),
          //             ),
          //             const SizedBox(
          //               width: 5,
          //             ),
          //             Text(
          //               currentIndex.toString(),
          //               style: const TextStyle(
          //                   fontWeight: FontWeight.bold, color: Colors.white),
          //             ),
          //             const SizedBox(
          //               width: 5,
          //             ),

          //             //add
          //             IconButton(
          //               onPressed: () {
          //                 //todo add icon function
          //                 setState(() {
          //                   currentIndex++;
          //                 });
          //               },
          //               icon: const Icon(
          //                 Icons.add,
          //                 color: Colors.white,
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //     GestureDetector(
          //       onDoubleTap: () {
          //         //todo provider inta laka fulina
          //         provider.addToCart(widget.product);

          //         const snackBar = SnackBar(
          //           content: Text(
          //             'successfully added ! ',
          //             style: TextStyle(
          //               fontSize: 25,
          //               fontWeight: FontWeight.bold,
          //               color: Colors.white,
          //             ),
          //           ),
          //           duration: Duration(seconds: 1),
          //         );
          //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
          //       },
          child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: kprimarayColor,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                onPressed: () {
                  provider.addToCart(widget.product);
                  log('Log: Clicked in add cart: ${provider.totalPrice()}');
                  log('Log:  Clicked in add cart: ${provider.cart}');
                  log('Log:  Clicked in add cart: ${provider.cart}');
                  print('Print: Cart Length: ${provider.cart.length}');
                },
                child: const Text(
                  'Add to cart',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ));
  }
}
