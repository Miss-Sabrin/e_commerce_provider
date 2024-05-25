// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Category {
  final String id;
  final String name;
  final String desc;
  final String photo;

  Category({
    required this.id,
    required this.name,
    required this.desc,
    required this.photo,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var myIp = '192.168.3.49';
    String photoUrl =
        json['photo'].replaceFirst('localhost:7900', '$myIp:5000');
    print('Original URL: ${json['photo']}');
    print('Updated URL: $photoUrl');
    return Category(
      id: json['_id'],
      name: json['name'],
      desc: json['desc'],
      photo: photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'photo': photo,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as String,
      name: map['name'] as String,
      desc: map['desc'] as String,
      photo: map['photo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  // factory Category.fromJson(String source) => Category.fromMap(json.decode(source) as Map<String, dynamic>);
}
