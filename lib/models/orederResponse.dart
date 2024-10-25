class OrderResponse {
  int status;
  String message;
  List<Order> data;
  String token;
  dynamic errors;

  OrderResponse({required this.status, required this.message, required this.data, required this.token, required this.errors});

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      status: json['status'],
      message: json['message'],
      data: List<Order>.from(json['data'].map((order) => Order.fromJson(order))),
      token: json['token'],
      errors: json['errors'],
    );
  }
}

class Order {
  int id;
  int userId;
  String status;
  int paymentStatus;
  String totalPrice;
  String createdAt;
  String updatedAt;
  User user;
  List<OrderItem> orderItems;

  Order({required this.id, required this.userId, required this.status, required this.paymentStatus, required this.totalPrice, required this.createdAt, required this.updatedAt, required this.user, required this.orderItems});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['user_id'],
      status: json['status'],
      paymentStatus: json['payment_status'],
      totalPrice: json['total_price'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      user: User.fromJson(json['user']),
      orderItems: List<OrderItem>.from(json['order_items'].map((item) => OrderItem.fromJson(item))),
    );
  }
}

class User {
  int id;
  String name;
  String phoneNumber;
  // Add other user properties

  User({required this.id, required this.name, required this.phoneNumber});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      // Add other properties if needed
    );
  }
}

class OrderItem {
  int id;
  int orderId;
  int productId;
  int quantity;
  String createdAt;
  String updatedAt;
  Product product;

  OrderItem({required this.id, required this.orderId, required this.productId, required this.quantity, required this.createdAt, required this.updatedAt, required this.product});

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      orderId: json['order_id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      product: Product.fromJson(json['product']),
    );
  }
}

class Product {
  int id;
  String scientificName;
  String commercialName;
  String companyName;
  int quantity;
  double price;
  String expiration;
  String image;
  Category category;

  Product({required this.id, required this.scientificName, required this.commercialName, required this.companyName, required this.quantity, required this.price, required this.expiration, required this.image, required this.category});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      scientificName: json['scientific_name'],
      commercialName: json['commercial_name'],
      companyName: json['company_name'],
      quantity: json['quantity'],
      price: json['price'],
      expiration: json['expiration'],
      image: json['image'],
      category: Category.fromJson(json['category']),
    );
  }
}

class Category {
  int id;
  String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }
}
