import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:e_commerce_provider/model/order_model.dart';
import 'package:shimmer/shimmer.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final String photo;
  const OrderCard({super.key, required this.order, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: CachedNetworkImage(
              imageUrl: photo,
              placeholder: (context, url) => Container(
                  height: 80,
                  width: 80,
                  child: const Center(child: CircularProgressIndicator())),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.products[0].product.name,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Apple", // Assuming the brand name or you can use another property
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 5),
                Text(
                  '\$${order.total}', // Assuming total price
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 16,
                      ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  'In Transit', // Assuming status
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kprimarayColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Track Order',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ShimmerOrderCard extends StatelessWidget {
  const ShimmerOrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 20,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 100,
                    height: 20,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 50,
                    height: 20,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300,
                  ),
                  child: Container(
                    width: 50,
                    height: 20,
                    color: Colors.grey.shade300,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
