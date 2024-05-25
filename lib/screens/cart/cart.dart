import 'package:e_commerce_provider/provider/cart_peovider.dart';
import 'package:e_commerce_provider/provider/favorite_provider.dart';
import 'package:e_commerce_provider/screens/cart/check_out.dart';
import 'package:e_commerce_provider/screens/constant.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartPeovider.of(context);
    final finalList = provider.cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      bottomSheet: const CheckOutBox(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: finalList.length,
              itemBuilder: (BuildContext context, int index) {
                // Getting the cart item
                final cartItem = finalList[index];
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                              height: 120,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: kcontentColor),
                              padding: EdgeInsets.all(10),
                              child: Image.network(cartItem.photos![0]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartItem.name ?? '',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  '\$${cartItem.price}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                // Quantity controls
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        provider.decrementQuantity(index);
                                      },
                                    ),
                                    Text(
                                      provider.quantity.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        provider.incrementQuantity(index);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // provider.removeProduct(index);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
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
        ],
      ),
    );
  }
}
