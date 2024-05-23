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
    String photoUrl = json['photo'].replaceFirst('localhost:7900', '192.168.100.7:5000');
    print('Original URL: ${json['photo']}');
    print('Updated URL: $photoUrl'); 
    return Category(
      id: json['_id'],
      name: json['name'],
      desc: json['desc'],
      photo: photoUrl,
    );
  }
}
