import 'package:e_commerce_provider/model/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CarUICard extends StatelessWidget {
  final Product product;
  const CarUICard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.5,
                  blurRadius: 0.5,
                  offset: const Offset(0, 1))
            ]),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.36,
                            padding: const EdgeInsets.only(left: 3),
                            // color: Colors.red,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                product.photos![0],
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                            )),
                        product.category?.name != null
                            ? Positioned(
                                top: 6,
                                right: 1,
                                child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    height: 26,
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          topLeft: Radius.circular(5)),
                                    ),
                                    child: Text(
                                      'new',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontSize: 12),
                                    )))
                            : const SizedBox.shrink(),
                        // Positioned(
                        //     top: 3,
                        //     left: 1,
                        //     child: Container(
                        //       padding: const EdgeInsets.all(5.0),
                        //       height: 26,
                        //       decoration: const BoxDecoration(
                        //         color: Colors.red,
                        //         borderRadius: BorderRadius.only(
                        //             bottomLeft: Radius.circular(5),
                        //             topLeft: Radius.circular(5)),
                        //       ),
                        //       child: Text(
                        //         'new',
                        //         style: Theme.of(context)
                        //             .textTheme
                        //             .bodySmall
                        //             ?.copyWith(color: Colors.white, fontSize: 12),
                        //       ),
                        //     )),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        // color: Colors.greenAccent,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${product.name}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.black54),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '\$${product.price.toString()} ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.60,
                              // color: Colors.blueAccent,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        size: 16,
                                        color: Colors.grey.shade600,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        product.units.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: Colors.grey.shade600,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        0.080,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.speed,
                                        size: 16,
                                        color: Colors.grey.shade600,
                                      ),
                                      const SizedBox(width: 3),
                                      Text("category,",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  color: Colors.grey.shade600)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
