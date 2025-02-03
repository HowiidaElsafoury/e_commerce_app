class UserTokens {
  String message;
  String token;

  UserTokens({
    required this.message,
    required this.token,
  });

  factory UserTokens.fromJson(Map<String, dynamic> json) => UserTokens(
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
      };
}
