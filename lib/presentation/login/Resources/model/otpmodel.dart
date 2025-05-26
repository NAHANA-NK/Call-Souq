

import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  bool success;
  Data data;
  String message;
  dynamic errors;

  OtpModel({
    required this.success,
    required this.data,
    required this.message,
    required this.errors,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
    errors: json["errors"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
    "errors": errors,
  };
}

class Data {
  String token;

  Data({
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}