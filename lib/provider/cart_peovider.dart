import 'package:e_commerce_provider/model/prodect_model.dart';
import 'package:e_commerce_provider/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPeovider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void toggleFavorite(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.units = (element.units ?? 0) + 1;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  //? : Add product to cart
  // void addToCart(Product product) {
  //   if (_cart.contains(product)) {
  //     product.units = (product.units ?? 0) + 1;
  //   } else {
  //     product.units = 1;
  //     _cart.add(product);
  //   }
  //   notifyListeners();
  // }

   void addToCart(Product product,int quantity) {
   
    int index = _cart.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      _cart[index].units = (_cart[index].units ?? 0) + quantity;
    } else {
      product.units = quantity;
      _cart.add(product);
    }
    notifyListeners();
  }

  ///todo quantity items
  

  void incrementQuantity(int index) {
    _cart[index].units = (_cart[index].units ?? 0) + 1;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    if (_cart[index].units != null && _cart[index].units! > 0) {
      _cart[index].units = _cart[index].units! - 1;
      notifyListeners();
    }
  }

  
  //todo total function
  double totalPrice() {
    double total = 0.0;
    for (Product element in _cart) {
      total += (element.price ?? 0) * (element.units ?? 1);
    }
    return total;
  }

  static CartPeovider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartPeovider>(context, listen: listen);
  }
}
