import 'dart:developer';

import 'package:e_commerce_provider/model/product.dart';
import 'package:e_commerce_provider/services/product.dart';
import 'package:flutter/material.dart';

enum ProductState { normal, loading, error, success }

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  Product? selectedProduct;
  ProductState state = ProductState.normal;

  Future<void> fetchAllProducts() async {
    try {
      state = ProductState.loading;
      notifyListeners();
      var pro = await ProductServices().getAllProducts();
      products.addAll(pro);
      state = ProductState.success;
      log('All Products: ${products.length}');
      notifyListeners();
    } catch (e) {
      state = ProductState.error;
      notifyListeners();
    }
  }

  Future<void> fetchProductById(String id) async {
    try {
      state = ProductState.loading;
      notifyListeners();
      selectedProduct = await ProductServices().getProductById(id);
      state = ProductState.success;
      notifyListeners();
    } catch (e) {
      state = ProductState.error;
      notifyListeners();
    }
  }
}
