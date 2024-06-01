// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

import 'package:e_commerce_provider/model/product.dart';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  final String? status;
  final List<Datum>? data;

  BannerModel({
    this.status,
    this.data,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final String? id;
  final String? name;
  final ProductId? productId;
  final String? desc;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Datum({
    this.id,
    this.name,
    this.productId,
    this.desc,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        productId: json["productId"] == null
            ? null
            : ProductId.fromJson(json["productId"]),
        desc: json["desc"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "productId": productId?.toJson(),
        "desc": desc,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class ProductId {
  final SalePrice? salePrice;
  final String? id;
  final String? name;
  final String? desc;
  final int? price;
  final String? category;
  final bool? isTrending;
  final List<String>? photos;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  ProductId({
    this.salePrice,
    this.id,
    this.name,
    this.desc,
    this.price,
    this.category,
    this.isTrending,
    this.photos,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        salePrice: json["salePrice"] == null
            ? null
            : SalePrice.fromJson(json["salePrice"]),
        id: json["_id"],
        name: json["name"],
        desc: json["desc"],
        price: json["price"],
        category: json["category"],
        isTrending: json["isTrending"],
        photos: json["photos"] == null
            ? []
            : List<String>.from(
                json["photos"]!.map((x) => replaceLocalhostWithIP(x))),
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
        "category": category,
        "isTrending": isTrending,
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
