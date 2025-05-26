import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  final Data data;

  ProfileModel({
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  final SupplierProfile supplierProfile;
  final PickupDetails pickupDetails;
  final BankAccount bankAccount;

  Data({
    required this.supplierProfile,
    required this.pickupDetails,
    required this.bankAccount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    supplierProfile: SupplierProfile.fromJson(json["supplier_profile"]),
    pickupDetails: PickupDetails.fromJson(json["pickup_details"]),
    bankAccount: BankAccount.fromJson(json["bank_account"]),
  );

  Map<String, dynamic> toJson() => {
    "supplier_profile": supplierProfile.toJson(),
    "pickup_details": pickupDetails.toJson(),
    "bank_account": bankAccount.toJson(),
  };
}

class SupplierProfile {
  final String supplierName;
  final String companyName;
  final String whatsappNumber;
  final String address;
  final String place;
  final String district;
  final String state;
  final String supplierType;
  final String uploadPhoto;

  SupplierProfile({
    required this.supplierName,
    required this.companyName,
    required this.whatsappNumber,
    required this.address,
    required this.place,
    required this.district,
    required this.state,
    required this.supplierType,
    required this.uploadPhoto,
  });

  factory SupplierProfile.fromJson(Map<String, dynamic> json) => SupplierProfile(
    supplierName: json["supplier_name"] ?? '',
    companyName: json["company_name"] ?? '',
    whatsappNumber: json["whatsapp_number"] ?? '',
    address: json["address"] ?? '',
    place: json["place"] ?? '',
    district: json["district"] ?? '',
    state: json["state"] ?? '',
    supplierType: json["supplier_type"] ?? '',
    uploadPhoto: json["upload_photo"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "supplier_name": supplierName,
    "company_name": companyName,
    "whatsapp_number": whatsappNumber,
    "address": address,
    "place": place,
    "district": district,
    "state": state,
    "supplier_type": supplierType,
    "upload_photo": uploadPhoto,
  };
}

class PickupDetails {
  final String roomFloorBuildNumber;
  final String location;
  final String landmark;
  final String pinCode;
  final String city;
  final String state;
  final User user;

  PickupDetails({
    required this.roomFloorBuildNumber,
    required this.location,
    required this.landmark,
    required this.pinCode,
    required this.city,
    required this.state,
    required this.user,
  });

  factory PickupDetails.fromJson(Map<String, dynamic> json) => PickupDetails(
    roomFloorBuildNumber: json["room_floor_build_number"] ?? '',
    location: json["location"] ?? '',
    landmark: json["landmark"] ?? '',
    pinCode: json["pin_code"] ?? '',
    city: json["city"] ?? '',
    state: json["state"] ?? '',
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "room_floor_build_number": roomFloorBuildNumber,
    "location": location,
    "landmark": landmark,
    "pin_code": pinCode,
    "city": city,
    "state": state,
    "user": user.toJson(),
  };
}

class User {
  final String email;

  User({
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "email": email,
  };
}

class BankAccount {
  final String accountNumber;
  final String ifscCode;

  BankAccount({
    required this.accountNumber,
    required this.ifscCode,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) => BankAccount(
    accountNumber: json["account_number"] ?? '',
    ifscCode: json["ifsc_code"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "account_number": accountNumber,
    "ifsc_code": ifscCode,
  };
}
