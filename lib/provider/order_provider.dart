import 'dart:developer';
import 'package:e_commerce_provider/model/order_model.dart';
import 'package:e_commerce_provider/provider/product.dart';
import 'package:e_commerce_provider/services/order.dart';
import 'package:flutter/material.dart';

enum OrderState { normal, loading, error, success }

class OrderProvider extends ChangeNotifier {
  List<Order> orders = [];
  OrderState state = OrderState.normal;
  Future<void> fetchOrderByUser(String userId) async {
    try {
      state = OrderState.normal;
      notifyListeners();
      var userOrders = await OrderServices().getOrderByUser(userId);
      orders.addAll(userOrders);
      state = OrderState.success;
      notifyListeners();
    } catch (e) {
      state = OrderState.error;
      log('Error on fetchin orders by user: $e');
    }
  }
}
