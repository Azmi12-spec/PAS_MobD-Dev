// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    final bool status;
    final String massage;
    final String token;

    LoginModel({
        required this.status,
        required this.massage,
        required this.token,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        massage: json["massage"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "massage": massage,
        "token": token,
    };
}
