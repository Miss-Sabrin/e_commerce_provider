import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_provider/constanst/constants.dart';

import 'package:e_commerce_provider/model/product.dart';
import 'package:e_commerce_provider/provider/cart_peovider.dart';

import 'package:e_commerce_provider/screens/detail/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double generateRandomNumber() {
      Random random = Random();
      double min = 3.8;
      double max = 5.0;
      double randomNumber = min + (random.nextDouble() * (max - min));
      return double.parse(randomNumber.toStringAsFixed(1));
    }

    double screanHeight = MediaQuery.of(context).size.height;
    double screanWidth = MediaQuery.of(context).size.width;
    // final provider = FavoriteProvider.of(context);
    final provider = CartProvider.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              product: product,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.31,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kcontentColor,
                  ),
                  child: Hero(
                      tag: product.photos![0],
                      child: CachedNetworkImage(
                        imageUrl: product.photos![0],
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        width: 120,
                        height: 120,
                        fit: BoxFit.contain,
                      )),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 15, color: Colors.grey.shade600),
                          ),
                          const Gap(5),
                          Text(
                            "\$${product.price}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                            generateRandomNumber().toString(),
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Positioned(
              top: 2,
              right: 2,
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: kprimarayColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      provider.addToCart(product);
                    },
                    child: const Icon(
                      // provider.isExist(product)
                      //     ? Icons.favorite
                      //     :
                      FontAwesomeIcons.cartShopping,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
