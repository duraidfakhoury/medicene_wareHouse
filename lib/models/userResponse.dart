//import 'dart:convert';

class userResponse {
  final String message;
  final int status;
  final UserData userData;

  userResponse({required this.message, required this.status, required this.userData});

  factory userResponse.fromJson(Map<String, dynamic> json) {
    return userResponse(
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
      userData: UserData.fromJson(json['data'] ?? {}),
    );
  }
}

class UserData {
  final User user;
  final Warehouse warehouse;

  UserData({required this.user, required this.warehouse});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      user: User.fromJson(json['user'] ?? {}),
      warehouse: Warehouse.fromJson(json['warehouse'] ?? {}),
    );
  }
}

class User {
  final int id;
  final String name;
  final String phoneNumber;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ??'',
      phoneNumber: json['phone_number'] ?? '',
      role: json['role'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
    );
  }
}

class Warehouse {
  final int id;
  final String name;
  final String location;
  final String image;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User warehouseOwner;

  Warehouse({
    required this.id,
    required this.name,
    required this.location,
    required this.image,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.warehouseOwner,
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) {
    return Warehouse(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      image: json['image'] ?? '',
      userId: json['user_id'] ?? 0,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
      warehouseOwner: User.fromJson(json['warehouseowner'] ?? {}),
    );
  }
}

