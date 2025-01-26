class RegisterRequestBody {
  String firstName;
  String lastName;
  String email;
  String password;
  String rePassword;
  String phone;
  String gender;

  RegisterRequestBody({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
    required this.gender,
  });

  factory RegisterRequestBody.fromJson(Map<String, dynamic> json) =>
      RegisterRequestBody(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        rePassword: json["rePassword"],
        phone: json["phone"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phone,
        "gender": gender,
      };
}
