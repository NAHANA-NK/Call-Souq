import 'dart:convert';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
  bool success;
  Data data;
  String message;
  dynamic error;

  TokenModel({
    required this.success,
    required this.data,
    required this.message,
    required this.error,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
    "error": error,
  };
}

class Data {
  int id;
  String fkGroup;
  String fkRole;
  String fullName;
  List<int> modulePermissions;
  List<dynamic> activityPermissions;
  UserProfile userProfile;
  Details companyDetails;
  RoleDetails roleDetails;
  Details groupProfileDetails;
  GroupDetails groupDetails;
  DateTime lastLogin;
  bool isSuperuser;
  DateTime createdAt;
  DateTime updatedAt;
  String uuid;
  String firstName;
  String lastName;
  String username;
  String mobile;
  String email;
  dynamic image;
  dynamic otp;
  dynamic verificationToken;
  int loggedDevices;
  bool isTokenVerified;
  bool isApproved;
  bool isStaff;
  bool isActive;
  String termsAccepted;
  int fkGroupProfile;
  dynamic createdBy;
  List<dynamic> groups;
  List<dynamic> userPermissions;
  String token;
  SupplierProfile supplierProfile;
  dynamic retailersProfile;

  Data({
    required this.id,
    required this.fkGroup,
    required this.fkRole,
    required this.fullName,
    required this.modulePermissions,
    required this.activityPermissions,
    required this.userProfile,
    required this.companyDetails,
    required this.roleDetails,
    required this.groupProfileDetails,
    required this.groupDetails,
    required this.lastLogin,
    required this.isSuperuser,
    required this.createdAt,
    required this.updatedAt,
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.mobile,
    required this.email,
    required this.image,
    required this.otp,
    required this.verificationToken,
    required this.loggedDevices,
    required this.isTokenVerified,
    required this.isApproved,
    required this.isStaff,
    required this.isActive,
    required this.termsAccepted,
    required this.fkGroupProfile,
    required this.createdBy,
    required this.groups,
    required this.userPermissions,
    required this.token,
    required this.supplierProfile,
    required this.retailersProfile,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    fkGroup: json["fk_group"],
    fkRole: json["fk_role"],
    fullName: json["full_name"],
    modulePermissions: List<int>.from(json["module_permissions"].map((x) => x)),
    activityPermissions: List<dynamic>.from(json["activity_permissions"].map((x) => x)),
    userProfile: UserProfile.fromJson(json["user_profile"]),
    companyDetails: Details.fromJson(json["company_details"]),
    roleDetails: RoleDetails.fromJson(json["role_details"]),
    groupProfileDetails: Details.fromJson(json["group_profile_details"]),
    groupDetails: GroupDetails.fromJson(json["group_details"]),
    lastLogin: DateTime.parse(json["last_login"]),
    isSuperuser: json["is_superuser"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    uuid: json["uuid"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    username: json["username"],
    mobile: json["mobile"],
    email: json["email"],
    image: json["image"],
    otp: json["otp"],
    verificationToken: json["verification_token"],
    loggedDevices: json["logged_devices"],
    isTokenVerified: json["is_token_verified"],
    isApproved: json["is_approved"],
    isStaff: json["is_staff"],
    isActive: json["is_active"],
    termsAccepted: json["terms_accepted"],
    fkGroupProfile: json["fk_group_profile"],
    createdBy: json["created_by"],
    groups: List<dynamic>.from(json["groups"].map((x) => x)),
    userPermissions: List<dynamic>.from(json["user_permissions"].map((x) => x)),
    token: json["token"],
    supplierProfile: SupplierProfile.fromJson(json["supplier_profile"]),
    retailersProfile: json["retailers_profile"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fk_group": fkGroup,
    "fk_role": fkRole,
    "full_name": fullName,
    "module_permissions": List<dynamic>.from(modulePermissions.map((x) => x)),
    "activity_permissions": List<dynamic>.from(activityPermissions.map((x) => x)),
    "user_profile": userProfile.toJson(),
    "company_details": companyDetails.toJson(),
    "role_details": roleDetails.toJson(),
    "group_profile_details": groupProfileDetails.toJson(),
    "group_details": groupDetails.toJson(),
    "last_login": lastLogin.toIso8601String(),
    "is_superuser": isSuperuser,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "uuid": uuid,
    "first_name": firstName,
    "last_name": lastName,
    "username": username,
    "mobile": mobile,
    "email": email,
    "image": image,
    "otp": otp,
    "verification_token": verificationToken,
    "logged_devices": loggedDevices,
    "is_token_verified": isTokenVerified,
    "is_approved": isApproved,
    "is_staff": isStaff,
    "is_active": isActive,
    "terms_accepted": termsAccepted,
    "fk_group_profile": fkGroupProfile,
    "created_by": createdBy,
    "groups": List<dynamic>.from(groups.map((x) => x)),
    "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
    "token": token,
    "supplier_profile": supplierProfile.toJson(),
    "retailers_profile": retailersProfile,
  };
}

class Details {
  int id;
  PlanDetails planDetails;
  SecurityQuestions securityQuestions;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic addressLine1;
  dynamic addressLine2;
  dynamic country;
  dynamic state;
  dynamic district;
  dynamic city;
  dynamic pincode;
  dynamic groupId;
  String groupName;
  dynamic instagram;
  dynamic facebook;
  dynamic linkedin;
  bool isActive;
  int fkGroup;
  dynamic createdBy;
  int fkAdmin;

  Details({
    required this.id,
    required this.planDetails,
    required this.securityQuestions,
    required this.createdAt,
    required this.updatedAt,
    required this.addressLine1,
    required this.addressLine2,
    required this.country,
    required this.state,
    required this.district,
    required this.city,
    required this.pincode,
    required this.groupId,
    required this.groupName,
    required this.instagram,
    required this.facebook,
    required this.linkedin,
    required this.isActive,
    required this.fkGroup,
    required this.createdBy,
    required this.fkAdmin,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    id: json["id"],
    planDetails: PlanDetails.fromJson(json["plan_details"]),
    securityQuestions: SecurityQuestions.fromJson(json["security_questions"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    addressLine1: json["address_line_1"],
    addressLine2: json["address_line_2"],
    country: json["country"],
    state: json["state"],
    district: json["district"],
    city: json["city"],
    pincode: json["pincode"],
    groupId: json["group_id"],
    groupName: json["group_name"],
    instagram: json["instagram"],
    facebook: json["facebook"],
    linkedin: json["linkedin"],
    isActive: json["is_active"],
    fkGroup: json["fk_group"],
    createdBy: json["created_by"],
    fkAdmin: json["fk_admin"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "plan_details": planDetails.toJson(),
    "security_questions": securityQuestions.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "address_line_1": addressLine1,
    "address_line_2": addressLine2,
    "country": country,
    "state": state,
    "district": district,
    "city": city,
    "pincode": pincode,
    "group_id": groupId,
    "group_name": groupName,
    "instagram": instagram,
    "facebook": facebook,
    "linkedin": linkedin,
    "is_active": isActive,
    "fk_group": fkGroup,
    "created_by": createdBy,
    "fk_admin": fkAdmin,
  };
}

class PlanDetails {
  dynamic renewalDate;
  dynamic renewalTime;
  dynamic extendedDate;
  dynamic staffLimit;
  dynamic deviceLimit;
  bool isActive;
  dynamic fkGroup;
  dynamic fkGroupProfile;
  dynamic createdBy;

  PlanDetails({
    required this.renewalDate,
    required this.renewalTime,
    required this.extendedDate,
    required this.staffLimit,
    required this.deviceLimit,
    required this.isActive,
    required this.fkGroup,
    required this.fkGroupProfile,
    required this.createdBy,
  });

  factory PlanDetails.fromJson(Map<String, dynamic> json) => PlanDetails(
    renewalDate: json["renewal_date"],
    renewalTime: json["renewal_time"],
    extendedDate: json["extended_date"],
    staffLimit: json["staff_limit"],
    deviceLimit: json["device_limit"],
    isActive: json["is_active"],
    fkGroup: json["fk_group"],
    fkGroupProfile: json["fk_group_profile"],
    createdBy: json["created_by"],
  );

  Map<String, dynamic> toJson() => {
    "renewal_date": renewalDate,
    "renewal_time": renewalTime,
    "extended_date": extendedDate,
    "staff_limit": staffLimit,
    "device_limit": deviceLimit,
    "is_active": isActive,
    "fk_group": fkGroup,
    "fk_group_profile": fkGroupProfile,
    "created_by": createdBy,
  };
}

class SecurityQuestions {
  String question;
  String answer;
  dynamic fkGroup;
  dynamic fkGroupProfile;
  dynamic createdBy;

  SecurityQuestions({
    required this.question,
    required this.answer,
    required this.fkGroup,
    required this.fkGroupProfile,
    required this.createdBy,
  });

  factory SecurityQuestions.fromJson(Map<String, dynamic> json) => SecurityQuestions(
    question: json["question"],
    answer: json["answer"],
    fkGroup: json["fk_group"],
    fkGroupProfile: json["fk_group_profile"],
    createdBy: json["created_by"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "answer": answer,
    "fk_group": fkGroup,
    "fk_group_profile": fkGroupProfile,
    "created_by": createdBy,
  };
}

class GroupDetails {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String group;
  bool isActive;
  int fkParent;

  GroupDetails({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.group,
    required this.isActive,
    required this.fkParent,
  });

  factory GroupDetails.fromJson(Map<String, dynamic> json) => GroupDetails(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    group: json["group"],
    isActive: json["is_active"],
    fkParent: json["fk_parent"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "group": group,
    "is_active": isActive,
    "fk_parent": fkParent,
  };
}

class RoleDetails {
  int id;
  List<dynamic> modulePermissions;
  List<dynamic> activityPermissions;
  dynamic fkParent;
  DateTime createdAt;
  DateTime updatedAt;
  String role;
  bool isActive;
  bool isDefault;
  bool isPrimitive;
  int fkGroup;
  dynamic fkGroupProfile;
  dynamic createdBy;

  RoleDetails({
    required this.id,
    required this.modulePermissions,
    required this.activityPermissions,
    required this.fkParent,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
    required this.isActive,
    required this.isDefault,
    required this.isPrimitive,
    required this.fkGroup,
    required this.fkGroupProfile,
    required this.createdBy,
  });

  factory RoleDetails.fromJson(Map<String, dynamic> json) => RoleDetails(
    id: json["id"],
    modulePermissions: List<dynamic>.from(json["module_permissions"].map((x) => x)),
    activityPermissions: List<dynamic>.from(json["activity_permissions"].map((x) => x)),
    fkParent: json["fk_parent"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    role: json["role"],
    isActive: json["is_active"],
    isDefault: json["is_default"],
    isPrimitive: json["is_primitive"],
    fkGroup: json["fk_group"],
    fkGroupProfile: json["fk_group_profile"],
    createdBy: json["created_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "module_permissions": List<dynamic>.from(modulePermissions.map((x) => x)),
    "activity_permissions": List<dynamic>.from(activityPermissions.map((x) => x)),
    "fk_parent": fkParent,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "role": role,
    "is_active": isActive,
    "is_default": isDefault,
    "is_primitive": isPrimitive,
    "fk_group": fkGroup,
    "fk_group_profile": fkGroupProfile,
    "created_by": createdBy,
  };
}

class SupplierProfile {
  int supplierProfileId;
  String uploadPhoto;
  String supplierName;
  String companyName;
  String address;
  String place;
  String district;
  String state;

  SupplierProfile({
    required this.supplierProfileId,
    required this.uploadPhoto,
    required this.supplierName,
    required this.companyName,
    required this.address,
    required this.place,
    required this.district,
    required this.state,
  });

  factory SupplierProfile.fromJson(Map<String, dynamic> json) => SupplierProfile(
    supplierProfileId: json["supplier_profile_id"],
    uploadPhoto: json["upload_photo"],
    supplierName: json["supplier_name"],
    companyName: json["company_name"],
    address: json["address"],
    place: json["place"],
    district: json["district"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "supplier_profile_id": supplierProfileId,
    "upload_photo": uploadPhoto,
    "supplier_name": supplierName,
    "company_name": companyName,
    "address": address,
    "place": place,
    "district": district,
    "state": state,
  };
}

class UserProfile {
  String addressLine1;
  String addressLine2;
  String country;
  String state;
  String district;
  String city;
  String pincode;
  dynamic dob;
  dynamic gender;
  dynamic fkGroup;
  dynamic fkGroupProfile;
  dynamic createdBy;

  UserProfile({
    required this.addressLine1,
    required this.addressLine2,
    required this.country,
    required this.state,
    required this.district,
    required this.city,
    required this.pincode,
    required this.dob,
    required this.gender,
    required this.fkGroup,
    required this.fkGroupProfile,
    required this.createdBy,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    addressLine1: json["address_line_1"],
    addressLine2: json["address_line_2"],
    country: json["country"],
    state: json["state"],
    district: json["district"],
    city: json["city"],
    pincode: json["pincode"],
    dob: json["dob"],
    gender: json["gender"],
    fkGroup: json["fk_group"],
    fkGroupProfile: json["fk_group_profile"],
    createdBy: json["created_by"],
  );

  Map<String, dynamic> toJson() => {
    "address_line_1": addressLine1,
    "address_line_2": addressLine2,
    "country": country,
    "state": state,
    "district": district,
    "city": city,
    "pincode": pincode,
    "dob": dob,
    "gender": gender,
    "fk_group": fkGroup,
    "fk_group_profile": fkGroupProfile,
    "created_by": createdBy,
  };
}