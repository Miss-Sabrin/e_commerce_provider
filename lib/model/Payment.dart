import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  final String? id;
  final String? name;
  final String? description;
  final String? type;

  Payment({
    this.id,
    this.name,
    this.description,
    this.type,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "type": type,
      };
}
