import 'dart:convert';
import 'package:e_commerce_provider/model/category.dart';
import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

String replaceLocalhostWithIP(String url) {
  if (!url.contains('http://') && !url.contains('https://')) {
    url = 'http://' + url;
  }

  return url
      .replaceAll('http://localhost:7900/', 'http://$myIp:5000/')
      .replaceAll('https://localhost:7900/', 'https://$myIp:5000/')
      .replaceAll('//public', '/public');
}

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  final SalePrice? salePrice;
  final String? id;
  final String? name;
  final String? desc;
  final int? price;
  final Category? category;
  final bool? isTrending;
  int? units;
  final List<String>? photos;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Product({
    this.salePrice,
    this.id,
    this.name,
    this.desc,
    this.price,
    this.category,
    this.isTrending,
    this.units,
    this.photos,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        salePrice: json["salePrice"] == null
            ? null
            : SalePrice.fromJson(json["salePrice"]),
        id: json["_id"],
        name: json["name"],
        desc: json["desc"],
        price: json["price"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        isTrending: json["isTrending"],
        units: json["units"],
        photos: json["photos"] == null
            ? []
            : List<String>.from(
                json["photos"].map((x) => replaceLocalhostWithIP(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "salePrice": salePrice?.toJson(),
        "_id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "category": category?.toJson(),
        "isTrending": isTrending,
        "units": units,
        "photos":
            photos == null ? [] : List<dynamic>.from(photos!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class SalePrice {
  final DateTime? startDate;
  final DateTime? endDate;

  SalePrice({
    this.startDate,
    this.endDate,
  });

  factory SalePrice.fromJson(Map<String, dynamic> json) => SalePrice(
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toJson() => {
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
      };
}

List<Color> listOfColors = [
  Colors.black,
  Colors.blue,
  Colors.orange,
];
