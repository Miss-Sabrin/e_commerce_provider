class Order {
  final String id;
  final Product product;
  final Category category;
  final User user;
  final PaymentMethod paymentMethod;
  final String status;
  final String desc;
  final int quantity;
  final int total;

  Order({
    required this.id,
    required this.product,
    required this.category,
    required this.user,
    required this.paymentMethod,
    required this.status,
    required this.desc,
    required this.quantity,
    required this.total,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'],
      product: Product.fromJson(json['productId']),
      category: Category.fromJson(json['category']),
      user: User.fromJson(json['user']),
      paymentMethod: PaymentMethod.fromJson(json['paymentMethod']),
      status: json['status'],
      desc: json['desc'],
      quantity: json['quantity'],
      total: json['total'],
    );
  }
}

class Product {
  final String id;
  final String name;
  final String desc;
  final double price;
  final String categoryId;
  final bool isTrending;
  final List<String> photos;
  final DateTime createdAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.categoryId,
    required this.isTrending,
    required this.photos,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      name: json['name'],
      desc: json['desc'],
      price: json['price'].toDouble(),
      categoryId: json['category'],
      isTrending: json['isTrending'],
      photos: List<String>.from(json['photos']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class Category {
  final String id;
  final String name;
  final String desc;
  final String photo;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.desc,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      desc: json['desc'],
      photo: json['photo'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class User {
  final String id;
  final String name;
  final String username;
  final String photoURL;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.photoURL,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      username: json['username'],
      photoURL: json['photoURL'],
    );
  }
}

class PaymentMethod {
  final String id;
  final String name;
  final String description;
  final String type;

  PaymentMethod({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      type: json['type'],
    );
  }
}
