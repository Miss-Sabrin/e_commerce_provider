import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:e_commerce_provider/provider/cart_peovider.dart';
import 'package:e_commerce_provider/screens/order/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // final provider = CartProvider.of(context);
    // final finalList = provider.cart;

    return Consumer<CartProvider>(builder: (context, provider, child) {
      if (provider.cart.isEmpty) {
        return const Center(
          child: Text('No Data!'),
        );
      }

      final finalList = provider.cart;

      return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
            centerTitle: true,
          ),
          bottomSheet: finalList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Subtotal'),
                                Text(
                                  '\$${finalList.fold(0, (sum, item) => sum + item.price! * item.units!)}',
                                ),
                              ],
                            ),
                            const Gap(5),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Shipping Fee'),
                                Text('\$5.00'),
                              ],
                            ),
                            const Gap(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Tax Fee'),
                                Text(
                                  '\$${finalList.fold(0, (sum, item) => sum + item.price! * item.units!) * 0.1}',
                                ),
                              ],
                            ),
                            const Gap(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Number of items'),
                                Text(
                                  '${finalList.length}',
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Order Total',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\$${finalList.fold(0, (sum, item) => sum + item.price! * item.units!) + 5 + (finalList.fold(0, (sum, item) => sum + item.price! * item.units!) * 0.1)}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Gap(10),
                      SizedBox(
                        height: tButtonHeight,
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kprimarayColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentPage(
                                  cartProducts: finalList,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Proceed to Payment',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: kcontentColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
          body: SizedBox(
            height: MediaQuery.of(context).size.height * 0.54,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: finalList.length,
              itemBuilder: (BuildContext context, int index) {
                // Getting the cart item
                final cartItem = finalList[index];
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kcontentColor,
                          border: Border.all(
                            color: Colors.grey.shade200,
                            width: 1,
                          ),
                        ),
                        padding: const EdgeInsets.only(
                            top: 20, left: 10, right: 10, bottom: 20),
                        child: Row(
                          children: [
                            Container(
                              height: 110,
                              width: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Image.network(cartItem.photos![0]),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartItem.name ?? '',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Gap(1),
                                    Text(cartItem.category?.name ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$${cartItem.price}',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // provider.removeProduct(index);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: kcontentColor,
                                            border: Border.all(
                                              color: Colors.grey.shade500,
                                              width: 1,
                                            ),
                                          ),
                                          child:
                                              const Icon(Icons.remove, size: 20)),
                                      onPressed: () {
                                        provider.decrementQuantity(index);
                                      },
                                    ),
                                    Text(
                                      cartItem.units.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    IconButton(
                                      icon: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: kcontentColor,
                                            border: Border.all(
                                              color: Colors.grey.shade500,
                                              width: 1,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            size: 20,
                                          )),
                                      onPressed: () {
                                        provider.incrementQuantity(index);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
          //   },
          // ),
          );
    });
  }
}
