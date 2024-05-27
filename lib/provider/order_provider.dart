import 'dart:developer';
import 'package:e_commerce_provider/model/order_model.dart';
import 'package:e_commerce_provider/services/order.dart';
import 'package:flutter/material.dart';

enum OrderState { normal, loading, error, success }

class OrderProvider extends ChangeNotifier {
  List<Order> orders = [];
  OrderState state = OrderState.normal;
  String errorMessage = '';
  String successMessage = '';

  Future<void> fetchOrderByUser(String userId) async {
    if (orders.isNotEmpty) return;

    try {
      state = OrderState.loading;
      notifyListeners();
      var userOrders = await OrderServices().fetchOrdersByUser(userId);
      orders = userOrders;
      // _ordersFetched = true;
      state = OrderState.success;
      successMessage = 'Successfully made an order';
      notifyListeners();
    } catch (e) {
      state = OrderState.error;
      log('Error on fetching orders by user: $e');
      notifyListeners();
    }
  }

  Future<void> createOrder(Map<String, dynamic> orderData) async {
    try {
      state = OrderState.loading;
      notifyListeners();
      await OrderServices().createOrder(orderData);
      state = OrderState.success;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      state = OrderState.error;
      notifyListeners();
    }
  }
}
