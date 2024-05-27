class Order {
  final String id;
  final String user;
  final Payment payment;
  final List<Product> products;
  final double total;
  final int phone;
  final String? note;
  final String? status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Order({
    required this.id,
    required this.user,
    required this.payment,
    required this.products,
    required this.total,
    required this.phone,
    this.note,
    this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'] ?? '',
      user: json['user'] ?? '',
      payment: Payment.fromJson(json['payment'] ?? {}),
      products: (json['products'] as List<dynamic>?)
              ?.map((i) => Product.fromJson(i as Map<String, dynamic>))
              .toList() ??
          [],
      total: (json['total'] ?? 0).toDouble(),
      phone: json['phone'] ?? 0,
      note: json['note'] ?? '',
      status: json['status'] ?? '',
      createdAt:
          DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt:
          DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() => {
        'user': user,
        'payment': payment.id,
        'products': products.map((p) => p.toJson()).toList(),
        'total': total,
        'phone': phone,
        'note': note,
        'status': status,
      };
}

class Payment {
  final String id;
  final String name;
  final String description;
  final String type;

  Payment({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'description': description,
        'type': type,
      };
}

class Product {
  final ProductDetails product;
  final int quantity;
  final String id;

  Product({
    required this.product,
    required this.quantity,
    required this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      product: ProductDetails.fromJson(json['product'] ?? {}),
      quantity: json['quantity'] ?? 0,
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'product': product.id,
        'quantity': quantity,
      };
}

class ProductDetails {
  final SalePrice salePrice;
  final String id;
  final String name;
  final String desc;
  final int price;
  final String category;
  final bool isTrending;
  final List<String> photos;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductDetails({
    required this.salePrice,
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.category,
    required this.isTrending,
    required this.photos,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      salePrice: SalePrice.fromJson(json['salePrice'] ?? {}),
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      desc: json['desc'] ?? '',
      price: json['price'] ?? 0,
      category: json['category'] ?? '',
      isTrending: json['isTrending'] ?? false,
      photos: List<String>.from(json['photos'] ?? []),
      createdAt:
          DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt:
          DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'desc': desc,
        'price': price,
        'category': category,
        'isTrending': isTrending,
        'photos': photos,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}

class SalePrice {
  final DateTime startDate;
  final DateTime endDate;

  SalePrice({
    required this.startDate,
    required this.endDate,
  });

  factory SalePrice.fromJson(Map<String, dynamic> json) {
    return SalePrice(
      startDate:
          DateTime.parse(json['startDate'] ?? DateTime.now().toIso8601String()),
      endDate:
          DateTime.parse(json['endDate'] ?? DateTime.now().toIso8601String()),
    );
  }
}
