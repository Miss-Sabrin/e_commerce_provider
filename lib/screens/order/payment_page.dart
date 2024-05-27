import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:e_commerce_provider/model/Payment.dart';
import 'package:e_commerce_provider/provider/order_provider.dart';
import 'package:e_commerce_provider/provider/payment_provider.dart';
import 'package:e_commerce_provider/provider/user.dart';
import 'package:e_commerce_provider/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../model/product.dart';

class PaymentPage extends StatefulWidget {
  final List<Product> cartProducts;

  const PaymentPage({super.key, required this.cartProducts});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPaymentMethod = 'Paypal';
  bool isEvcVisible = false;
  String paymentId = '';
  TextEditingController textEditingController = TextEditingController();
  String errorMessage = '';

  void _showPaymentMethods(BuildContext context, List<PaymentModel> payments) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Payment Method',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: payments.length,
                itemBuilder: (context, index) {
                  final payment = payments[index];
                  return ListTile(
                    title: Text(payment.name ?? ''),
                    leading: Icon(FontAwesomeIcons.googlePay),
                    trailing: Radio<String>(
                      value: payment.name ?? '',
                      groupValue: selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value!;
                          print('paymentId: ${payment.id}');
                          if (payment.id != null) {
                            paymentId = payment.id!;
                          }
                          if (value == "EVC") {
                            isEvcVisible = true;
                          } else {
                            isEvcVisible = false;
                          }
                        });
                        Navigator.pop(context);
                      },
                    ),
                    onTap: () {
                      setState(() {
                        selectedPaymentMethod = payment.name!;
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false);
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    final paymentProvider =
        Provider.of<PaymentProvider>(context, listen: false);
    final payments = paymentProvider.payments;
    final userId = user.user.id;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Review'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: ListView.builder(
                    itemCount: widget.cartProducts.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, int index) {
                      final cartItem = widget.cartProducts[index];
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: ListTile(
                          leading: Image.network(
                            cartItem.photos![0],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            cartItem.name ?? '',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                              'Size EU 32  Color Green\nQuantity: ${cartItem.units}'),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Subtotal'),
                    Text(
                      '\$${widget.cartProducts.fold(0, (sum, item) => sum + item.price! * item.units!)}',
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shipping Fee'),
                    Text('\$5.00'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Tax Fee'),
                    Text(
                      '\$${widget.cartProducts.fold(0, (sum, item) => sum + item.price! * item.units!) * 0.1}',
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Order Total',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${widget.cartProducts.fold(0, (sum, item) => sum + item.price! * item.units!) + 5 + (widget.cartProducts.fold(0, (sum, item) => sum + item.price! * item.units!) * 0.1)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Payment Method',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListTile(
                  title: Text(selectedPaymentMethod),
                  trailing: const Icon(Icons.arrow_drop_down),
                  onTap: () => _showPaymentMethods(context, payments),
                ),
                const Divider(),
                const SizedBox(height: 20),
                if (isEvcVisible)
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Number lacagta ka direysid',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        MyTextField(
                          hintText: '615560729',
                          controller: textEditingController,
                          isEnabled: true,
                        )
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                if (errorMessage.isNotEmpty)
                  Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () async {
                    final orderData = {
                      'user': userId,
                      'payment': paymentId,
                      'products': widget.cartProducts
                          .map((p) => {
                                'product': p.id,
                                'quantity': p.units,
                              })
                          .toList(),
                      'note': 'Order',
                      // 'total': widget.cartProducts.fold(
                      //     0, (sum, item) => sum + item.price! * item.units!),
                      'total': 0.01,
                      'phone': textEditingController.text,
                    };

                    try {
                      if (textEditingController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Plz provide number!')),
                        );
                      }
                      await orderProvider.createOrder(orderData);
                      if (orderProvider.state == OrderState.success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Succesfull made an order✔️')),
                        );
                      } else {
                        orderProvider.state = OrderState.error;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Error: ${orderProvider.errorMessage}')),
                        );
                      }
                    } catch (e) {
                      setState(() {
                        errorMessage = e.toString();
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    backgroundColor: kprimarayColor,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: orderProvider.state == OrderState.loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          'Pay Now \$${widget.cartProducts.fold(0, (sum, item) => sum + item.price! * item.units!) + 5 + (widget.cartProducts.fold(0, (sum, item) => sum + item.price! * item.units!) * 0.1)}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white, fontSize: 16),
                        ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
