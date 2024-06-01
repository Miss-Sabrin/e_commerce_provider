import 'dart:developer';

import 'package:e_commerce_provider/model/product.dart';
import 'package:e_commerce_provider/services/product.dart';
import 'package:flutter/material.dart';

enum ProductState { normal, loading, error, success, notFound }

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  List<Product> productsByCategory = [];
  List<Product> searchResults = [];
  Product? selectedProduct;
  ProductState state = ProductState.normal;

  void searchProducts(String query) {
    searchResults = products.where((product) {
      return product.name!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    notifyListeners();
  }

  Future<void> fetchAllProducts() async {
    try {
      state = ProductState.loading;
      notifyListeners();
      var pro = await ProductServices().getAllProducts();
      products = pro;
      state = ProductState.success;
      log('All Products: ${products.length}');
      notifyListeners();
    } catch (e) {
      state = ProductState.error;
      notifyListeners();
    }
  }

  Future<void> fetchProductsByCategory(String categoryId) async {
    try {
      state = ProductState.loading;
      productsByCategory.clear(); // Clear previous category products
      notifyListeners();
      var pro = await ProductServices().fetchProductsByCategories(categoryId);
      productsByCategory = pro;
      state = ProductState.success;
      log('Products by category: ${productsByCategory.length}');
      notifyListeners();
    } catch (e) {
      if (e.toString().contains('No Data Found')) {
        state = ProductState.notFound;
      } else {
        state = ProductState.error;
      }
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
