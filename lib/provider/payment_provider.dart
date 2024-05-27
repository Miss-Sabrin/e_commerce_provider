import 'dart:developer';

import 'package:e_commerce_provider/model/Payment.dart';
import 'package:e_commerce_provider/services/payments.dart';
import 'package:flutter/material.dart';

enum PaymentState { normal, loading, error, success }

class PaymentProvider extends ChangeNotifier {
  List<PaymentModel> payments = [];
  PaymentState state = PaymentState.normal;

  Future<void> fetchAllPayments() async {
    try {
      state = PaymentState.loading;
      notifyListeners();
      payments = await PaymentServices().getAllPayments();
      state = PaymentState.success;
      notifyListeners();
    } catch (e) {
      state = PaymentState.error;
      log('Error: $e');
      notifyListeners();
    }
  }
}
