import 'package:flutter/material.dart';
class   ProductModel{
final String title;
final String review;
final String category;
final String image;
final String description;
int quantity;
final double rate;
final double price;
final String saller;
final List<Color>colors;

  ProductModel(
  {  required this.category,
    required this.colors,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity ,
    required this.rate,
    required this.review,
    required this.saller,
    required this.title,
    });
}

    final List<ProductModel>products=[
      ProductModel(
        title: 'wirles headphone',
        category: 'electronics', 
        colors: [
          Colors.black,
          Colors.blue,
          Colors.orange
        ],
         description:'the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.' , 
         image: 'images/wireless.png',
         price: 12,
         quantity: 1, 
         rate: 4.0, 
         review: "(32 review)", 
         saller: 'tariquel islam'),
         ProductModel(
          title: 'wommen sweet',
        category: 'electronics', 
        colors: [
          Colors.black,
          Colors.blue,
          Colors.orange
        ],
         description:'the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.' , 
         image: 'images/sweet.png',
         price: 12,
         quantity: 1, 
         rate: 4.0, 
         review: "(32 review)", 
         saller: 'tariquel islam'),
         ProductModel(
          title: 'jacket',
        category: 'electronics', 
        colors: [
          Colors.black,
          Colors.blue,
          Colors.orange
        ],
         description:'the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.' , 
         image: 'images/jacket.png',
         price: 12,
         quantity: 1, 
         rate: 4.0, 
         review: "(32 review)", 
         saller: 'tariquel islam'),
         ProductModel(
          title: 'smart watch',
        category: 'electronics', 
        colors: [
          Colors.black,
          Colors.blue,
          Colors.orange
        ],
         description:'the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.' , 
         image: 'images/miband.jpg',
         price: 12,
         quantity: 1, 
         rate: 4.0, 
         review: "(32 review)", 
         saller: 'tariquel islam')
    ];






