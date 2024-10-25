class WarehouseResponse {
  final int status;
  final String message;
  final WarehouseData data;
  final String? token;
  final dynamic errors;

  WarehouseResponse({
    required this.status,
    required this.message,
    required this.data,
    this.token,
    this.errors,
  });

  factory WarehouseResponse.fromJson(Map<String, dynamic> json) {
    return WarehouseResponse(
      status: json['status'],
      message: json['message'],
      data: WarehouseData.fromJson(json['data']),
      token: json['token'],
      errors: json['errors'],
    );
  }
}

class WarehouseData {
  final int id;
  final String name;
  final String location;
  final String image;
  final int userId;
  final String createdAt;
  final String updatedAt;
  final WarehouseOwner warehouseOwner;

  WarehouseData({
    required this.id,
    required this.name,
    required this.location,
    required this.image,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.warehouseOwner,
  });

  factory WarehouseData.fromJson(Map<String, dynamic> json) {
    return WarehouseData(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      image: json['image'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      warehouseOwner: WarehouseOwner.fromJson(json['warehouseowner']),
    );
  }
}

class WarehouseOwner {
  final int id;
  final String name;
  final String phoneNumber;
  final dynamic deviceKey;
  final String role;
  final String createdAt;
  final String updatedAt;

  WarehouseOwner({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.deviceKey,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WarehouseOwner.fromJson(Map<String, dynamic> json) {
    return WarehouseOwner(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      deviceKey: json['device_key'],
      role: json['role'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
