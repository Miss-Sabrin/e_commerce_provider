import 'dart:developer';

import 'package:e_commerce_provider/model/Payment.dart';
import 'package:e_commerce_provider/services/payments.dart';
import 'package:flutter/material.dart';

enum PaymentState { normal, loading, error, success }

class PaymentProvider extends ChangeNotifier {
  List<PaymentModel> _payments = [];
  List<PaymentModel> get payments => _payments;
  PaymentState state = PaymentState.normal;

  Future<void> fetchAllPayments() async {
    try {
      if (payments.isNotEmpty) return;

      state = PaymentState.loading;
      notifyListeners();
      _payments = await PaymentServices().getAllPayments();
      state = PaymentState.success;
      notifyListeners();
    } catch (e) {
      state = PaymentState.error;
      log('Error: $e');
      notifyListeners();
    }
  }
}
