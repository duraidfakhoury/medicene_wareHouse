class ApiResponse {
  final String message;
  final int status;
  final List<Product> data;
  final String token;
  final dynamic errors;

  ApiResponse({
    required this.message,
    required this.status,
    required this.data,
    required this.token,
    required this.errors,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((productJson) => Product.fromJson(productJson ?? {}))
              .toList() ?? [],
      token: json['token'] ?? '',
      errors: json['errors'] ?? null,
    );
  }
}

class Product {
  final int id;
  final String scientificName;
  final String commercialName;
  final String companyName;
  final int quantity;
  final int price;
  final int categoryId;
  final int warehouseId;
  final DateTime expiration;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Category category;

  Product({
    required this.id,
    required this.scientificName,
    required this.commercialName,
    required this.companyName,
    required this.quantity,
    required this.price,
    required this.categoryId,
    required this.warehouseId,
    required this.expiration,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      scientificName: json['scientific_name'] ?? '',
      commercialName: json['commercial_name'] ?? '',
      companyName: json['company_name'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: json['price'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      warehouseId: json['warehouse_id'] ?? 0,
      expiration: DateTime.parse(json['expiration'] ?? ''),
      image: json['image'] ?? '',
      createdAt: DateTime.parse(json['created_at'] ?? ''),
      updatedAt: DateTime.parse(json['updated_at'] ?? ''),
      category: Category.fromJson(json['category'] ?? {}),
    );
  }
}

class Category {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      createdAt: DateTime.parse(json['created_at'] ?? ''),
      updatedAt: DateTime.parse(json['updated_at'] ?? ''),
    );
  }
}
