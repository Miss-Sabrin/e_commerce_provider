import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:e_commerce_provider/provider/order_provider.dart';
import 'package:e_commerce_provider/provider/user.dart';
import 'package:e_commerce_provider/widget/order_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    final userId = userProvider.user.id;
    if (userId != null && userId.isNotEmpty) {
      await orderProvider.fetchOrderByUser(userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final orders = orderProvider.orders;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: orderProvider.state == OrderState.loading
          ? ListView.builder(
              itemCount: 5, // Number of shimmer cards to display
              itemBuilder: (context, index) => const ShimmerOrderCard(),
            )
          : orderProvider.state == OrderState.error
              ? const Center(child: Text('Error fetching orders'))
              : orders.isEmpty
                  ? const Center(child: Text('No orders found.'))
                  : ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final order = orders[index];
                        // Access the first photo of the first product in the order
                        final photo = order.products.isNotEmpty &&
                                order.products[0].product.photos.isNotEmpty
                            ? order.products[0].product.photos[0]
                            : 'default_image_url'; // Provide a default URL if no photo is available

                        return OrderCard(
                          order: order,
                          photo: photo,
                        );
                      },
                    ),
    );
  }
}
