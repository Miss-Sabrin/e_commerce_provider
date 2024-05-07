import 'package:e_commerce_provider/model/prodect_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartPeovider extends ChangeNotifier{
  final List <ProductModel> _cart=[];
  List<ProductModel> get cart=>_cart;

  void toggleFavorite(ProductModel product){
    if(_cart.contains(product)){
      for(ProductModel element in _cart){
        element.quantity ++;
      }
    }else{
      _cart.add(product);
    }
    notifyListeners();
  }

  ///todo quantity items
  ///

increamentQtn(int index)=>_cart[index].quantity++; 
decreamentQtn(int index)=>_cart[index].quantity--; 



  ///
  //todo total function
  totalPrice(){
    double total=0.0;
    for(ProductModel element in _cart){
      total +=element.price *element.quantity;
    }
    return total;
  }


  static CartPeovider of(
    BuildContext context,{
      bool listen=true,
    }){
      return Provider.of<CartPeovider>(
        context,
        listen: listen
      );
    }
  
   
}