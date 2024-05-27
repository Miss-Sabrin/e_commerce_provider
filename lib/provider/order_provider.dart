import 'dart:developer';
import 'package:e_commerce_provider/model/order_model.dart';
import 'package:e_commerce_provider/services/order.dart';
import 'package:flutter/material.dart';

enum OrderState { normal, loading, error, success }

class OrderProvider extends ChangeNotifier {
  List<Order> orders = [];
  OrderState state = OrderState.normal;

  Future<void> fetchOrderByUser(String userId) async {
    if (orders.isNotEmpty) return;

    try {
      state = OrderState.loading;
      notifyListeners();
      var userOrders = await OrderServices().fetchOrdersByUser(userId);
      orders = userOrders;
      // _ordersFetched = true;
      state = OrderState.success;
      notifyListeners();
    } catch (e) {
      state = OrderState.error;
      log('Error on fetching orders by user: $e');
      notifyListeners();
    }
  }

  Future<void> createOrder(
      String userId,
      String paymentId,
      List<Map<String, dynamic>> products,
      String note,
      double total,
      int phone) async {
    try {
      state = OrderState.loading;
      notifyListeners();
      final order = {
        "user": userId,
        "payment": paymentId,
        "products": products,
        "note": note,
        "total": total,
        "phone": phone
      };
      final createdOrder = await OrderServices().createOrder(order);
      orders.add(createdOrder);
      state = OrderState.success;
      notifyListeners();
    } catch (e) {
      state = OrderState.error;
      log('Error on creating order: $e');
      notifyListeners();
    }
  }
}
