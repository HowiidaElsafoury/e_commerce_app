import 'package:e_commerce_app/features/profile/domain/entity/user_entity.dart';

class ProfileUser {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  List<dynamic>? wishlist;
  List<dynamic>? addresses;
  DateTime? createdAt;

  ProfileUser({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.wishlist,
    this.addresses,
    this.createdAt,
  });

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      phone: phone,
      photo: photo,
      role: role,
    );
  }

  factory ProfileUser.fromJson(Map<String, dynamic> json) => ProfileUser(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        gender: json["gender"],
        phone: json["phone"],
        photo: json["photo"],
        role: json["role"],
        wishlist: List<dynamic>.from(json["wishlist"].map((x) => x)),
        addresses: List<dynamic>.from(json["addresses"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "gender": gender,
        "phone": phone,
        "photo": photo,
        "role": role,
        "wishlist": List<dynamic>.from(wishlist?.map((x) => x) ?? []),
        "addresses": List<dynamic>.from(addresses?.map((x) => x) ?? []),
        "createdAt": createdAt?.toIso8601String(),
      };
}
