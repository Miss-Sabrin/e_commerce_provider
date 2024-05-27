import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:e_commerce_provider/provider/cart_peovider.dart';
import 'package:e_commerce_provider/screens/order/payment_page.dart';
import 'package:flutter/material.dart';

class CheckOutBox extends StatelessWidget {
  final VoidCallback callback;
  const CheckOutBox({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);

    return Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // TextField(
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(30),
          //       borderSide: BorderSide.none,

          //     ),
          //     contentPadding: const EdgeInsets.symmetric(
          //       vertical: 5,
          //       horizontal: 15
          //     ),
          //     filled: true,
          //     hintText: 'enter discount code',
          //     hintStyle: TextStyle(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w600,
          //       color: Colors.grey,

          //     ),
          //     fillColor: kcontentColor,
          //     suffixIcon: TextButton(
          //       onPressed: () {

          //       },

          //       child: Text('Applay',
          //       style: TextStyle(color: kprimarayColor,fontSize: 20,
          //       fontWeight: FontWeight.bold
          //       ),)

          //     ,)
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                "\$${provider.totalPrice()}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 18,
                  //fontWeight: FontWeight.bold
                ),
              ),
              Text(
                " \$${provider.totalPrice()}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                callback();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: kprimarayColor,
                  minimumSize: const Size(double.infinity, 55)),
              child: const Text(
                'Check out',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
