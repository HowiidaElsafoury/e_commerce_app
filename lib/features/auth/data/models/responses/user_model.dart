class UserModel {
  String message;
  User user;
  String token;

  UserModel({
    required this.message,
    required this.user,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  String firstName;
  String lastName;
  String email;
  String gender;
  String phone;
  String photo;
  String role;
  List<dynamic> wishlist;
  String id;
  List<dynamic> addresses;
  DateTime createdAt;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.phone,
    required this.photo,
    required this.role,
    required this.wishlist,
    required this.id,
    required this.addresses,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        gender: json["gender"],
        phone: json["phone"],
        photo: json["photo"],
        role: json["role"],
        wishlist: List<dynamic>.from(json["wishlist"].map((x) => x)),
        id: json["_id"],
        addresses: List<dynamic>.from(json["addresses"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "gender": gender,
        "phone": phone,
        "photo": photo,
        "role": role,
        "wishlist": List<dynamic>.from(wishlist.map((x) => x)),
        "_id": id,
        "addresses": List<dynamic>.from(addresses.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
      };
}
