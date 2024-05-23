import 'package:e_commerce_provider/provider/favorite_provider.dart';
import 'package:e_commerce_provider/screens/constant.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorite;

    return Scaffold(
      appBar: AppBar(
        title: Text('favorite'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: finalList.length,
              itemBuilder: (BuildContext context, int index) {
                //todo making cart item
                final favoriteItem = finalList[index];
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                              height: 120,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: kcontentColor),
                              padding: EdgeInsets.all(10),
                              child: Image.asset(favoriteItem.photos![0]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  favoriteItem.name ?? '',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                //  Text(favoriteItem.category ?? '',
                                // style: TextStyle(fontSize: 14,
                                // fontWeight: FontWeight.bold,
                                // color: Colors.grey
                                // ),
                                // ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  '\$${favoriteItem.price}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 40,
                        right: 40,
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  finalList.removeAt(index);
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),

                            const SizedBox(
                              height: 10,
                            ),
                            //todo add and remove icons
                          ],
                        ))
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
