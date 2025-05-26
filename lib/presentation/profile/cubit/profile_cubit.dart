import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../resources/model/profilemodel.dart';

part 'profile_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {

  final String token;
  String profileUrl = '';

  HomeScreenCubit(this.token) : super(HomeScreenInitial()) {
    getDetails();
    print("called");
  }

  // late final String baseUrl = "https://callsouq-api.foxa.in/";
  String? imagePath;
  bool isEditable = false;
  int selectedIndex = 1;
  File? image;
  final ImagePicker _picker = ImagePicker();


  Future<void> getDetails() async {
    emit(GetDetailsLoading());

    try {
      final url =
          "https://callsouq-api.foxa.in/api/user-profile/?activity_code=1020";
      final response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Token $token",
        "Accept": "application/json",
      });
      if (response.statusCode == 200) {
        print("success");
        final data = profileModelFromJson(response.body);
        print(data.data);


        //getting Profile Image
        // imagePath = data.data.supplierProfile.uploadPhoto;
        // profileUrl = baseUrl + imagePath!;

        imagePath = data.data.supplierProfile.uploadPhoto;
        print(imagePath);
        print("hufedggey");
        final String baseUrl = "https://callsouq-api.foxa.in/";
final profileUrl = Uri.parse("https://callsouq-api.foxa.in/").resolve(imagePath!).toString();
        originalName = data.data.supplierProfile.supplierName;
        supplierType = data.data.supplierProfile.supplierType;
        originalEmail = data.data.pickupDetails.user.email;
        originalCompanyName = data.data.supplierProfile.companyName;
        originalWhatsappNumber = data.data.supplierProfile.whatsappNumber;
        originalAddress = data.data.supplierProfile.address;
        originalPlace = data.data.supplierProfile.place;
        originalDistrict = data.data.supplierProfile.district;
        originalPersonState = data.data.supplierProfile.state;
        originalRoomFloorBuildingNumber = data.data.pickupDetails.roomFloorBuildNumber;
        originalLocation = data.data.pickupDetails.location;
        originalLandmark = data.data.pickupDetails.landmark;
        originalPINCode = data.data.pickupDetails.pinCode;
        originalCity = data.data.pickupDetails.city;
        originalCompanyState = data.data.pickupDetails.state;
        originalGSTNumber = data.data.bankAccount.ifscCode;
        originalAccountNumber = data.data.bankAccount.accountNumber;
        originalIFSCCode = data.data.bankAccount.ifscCode;


        companyNameController.text = originalCompanyName;
        whatsappNumberController.text = originalWhatsappNumber;
        addressController.text = originalAddress;
        placeController.text = originalPlace;
        districtController.text = originalDistrict;
        personStateController.text = originalPersonState;
        roomFloorBuildingNumberController.text = originalRoomFloorBuildingNumber;
        locationController.text = originalLocation;
        landmarkController.text = originalLandmark;
        pINCodeController.text = originalPINCode;
        cityController.text = originalCity;
        companyStateController.text = originalCompanyState;
        gSTNumberController.text = originalGSTNumber;
        accountNumberController.text = originalAccountNumber;
        iFSCCodeController.text = originalIFSCCode;
        emit(ProfileImageUpdated(profileUrl: profileUrl));
        emit(GetDetailsLoaded(data: data));

      } else {
        print("failed");
        final data =jsonDecode(response.body);
        final problem =data["error"];
        print(data);
        emit(GetDetailsError(problem: problem));
      }
    } catch (e) {
      emit(GetDetailsError(problem: e as String));
      print(e);
    }
  }


//Defining profile Values
  String originalName = '';
  String originalEmail = '';
  String supplierType = '';
  String originalCompanyName = '';
  String originalWhatsappNumber = '';
  late String originalAddress;
  late String originalPlace;
  late String originalDistrict;
  late String originalPersonState;
  late String originalRoomFloorBuildingNumber;
  late String originalLocation;
  late String originalLandmark;
  late String originalPINCode;
  late String originalCity;
  late String originalCompanyState;
  late String originalGSTNumber;
  late String originalAccountNumber;
  late String originalIFSCCode;


//Defining TextEditing Controllers
  late TextEditingController companyNameController = TextEditingController();
  late TextEditingController whatsappNumberController = TextEditingController();
  late TextEditingController addressController = TextEditingController();
  late TextEditingController placeController = TextEditingController();
  late TextEditingController districtController = TextEditingController();
  late TextEditingController personStateController = TextEditingController();
  late TextEditingController roomFloorBuildingNumberController = TextEditingController();
  late TextEditingController locationController = TextEditingController();
  late TextEditingController landmarkController = TextEditingController();
  late TextEditingController pINCodeController = TextEditingController();
  late TextEditingController cityController = TextEditingController();
  late TextEditingController companyStateController = TextEditingController();
  late TextEditingController gSTNumberController = TextEditingController();
  late TextEditingController accountNumberController = TextEditingController();
  late TextEditingController iFSCCodeController = TextEditingController();


  //switch index Pages
  void switchScreen(int screenNumber) {
    // cancelEdit();
    selectedIndex = screenNumber;
    emit(HomeScreenLoaded(selectedScreen: screenNumber));
  }


  //Editing Profile Picture
  Future<void> pickImage(ImageSource source) async {
    print("pick image");
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      print("worked");
      image = File(pickedFile.path);
      emit(HomeScreenImagePicked(image!));
    }
  }




  //Personal Details 'PUT'
  Future<void> putPersonalDetails(BuildContext context) async {
    final String url =
        "https://callsouq-api.foxa.in/api/supplier-profile/update/?activity_code=1021";
    var request = http.MultipartRequest("PUT", Uri.parse(url));

    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': "Token $token"
    });
    if (image == null && image!.path.isNotEmpty) {
      print("image null");
    }
    if (image != null && image!.path.isNotEmpty) {
      print("ebjf");
      print(image?.path);
      request.files.add(await http.MultipartFile.fromPath('upload_photo', image!.path));
    }


    if (originalName.isNotEmpty) {
      request.fields["supplier_name"] = originalName;
    }

    if (companyNameController.text.isNotEmpty) {
      request.fields["company_name"] = companyNameController.text;
    }

    if (addressController.text.isNotEmpty) {
      request.fields["address"] = addressController.text;
    }

    if (placeController.text.isNotEmpty) {
      request.fields["place"] = placeController.text;
    }

    if (districtController.text.isNotEmpty) {
      request.fields["district"] = districtController.text;
    }

    if (personStateController.text.isNotEmpty) {
      request.fields["state"] = personStateController.text;
    }

    if (supplierType.isNotEmpty) {
      request.fields["supplier_type"] = supplierType;
    }

    if (whatsappNumberController.text.isNotEmpty) {
      request.fields["whatsapp_number"] = whatsappNumberController.text;
    }


    var response = await request.send();

    
    if (response.statusCode == 200) {
      await getDetails();
      image = null;
      print("success");
      emit(PutDetailsSuccess());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.green,
          content: Text("Saved")));
    } else {
      var responseBody = await response.stream.bytesToString();
      print("Error response: $responseBody");

      emit(PutDetailsError());
    }
  }


  void putCompanyDetails(BuildContext context) async {
    String url =
        "https://callsouq-api.foxa.in/api/pickup-details/update/?activity_code=1028";

    final Map body = {
      "room_floor_build_number": roomFloorBuildingNumberController.text ,
      "latitude": "10.1234",
      "longitude": "76.5678",
      "location": locationController.text,
      "landmark": landmarkController.text,
      "pin_code": pINCodeController.text,
      "city": cityController.text,
      "state": companyStateController.text,
    };
    try {
      final response = await http.put(Uri.parse(url),
          headers: {
            "Authorization": "Token $token",

            "Accept": "application/json",
          },

          body: body);

      if (response.statusCode == 200) {
        print("success");
        print(token);
        getDetails();
        emit(PutDetailsSuccess());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.green,
            content: Text("Saved")));
      } else {
        emit(PutDetailsError());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,
            content: Text("Failed!")));
      }
    } catch (e) {
      print(e);
    }
  }


  void editMode() {
    isEditable = true;
    emit(TextEditable());
  }

  void spacialEdit(item) {
    emit(sacialEditState(item: item));
  }


  void cancelEdit() {
    companyNameController.text = originalCompanyName;
    whatsappNumberController.text = originalWhatsappNumber;
    addressController.text = originalAddress;
    placeController.text = originalPlace;
    districtController.text = originalDistrict;
    personStateController.text = originalPersonState;
    roomFloorBuildingNumberController.text = originalRoomFloorBuildingNumber;
    locationController.text = originalLocation;
    landmarkController.text = originalLandmark;
    pINCodeController.text = originalPINCode;
    cityController.text = originalCity;
    companyStateController.text = originalCompanyState;
    gSTNumberController.text = originalGSTNumber;
    accountNumberController.text = originalAccountNumber;
    iFSCCodeController.text = originalIFSCCode;

    isEditable = false;
    emit(EditCanceled());
  }

  void saveEdit() {
    originalCompanyName = companyNameController.text;
    originalWhatsappNumber = whatsappNumberController.text;
    originalAddress = addressController.text;
    originalPlace = placeController.text;
    originalDistrict = districtController.text;
    originalPersonState = personStateController.text;
    originalRoomFloorBuildingNumber = roomFloorBuildingNumberController.text;
    originalLocation = locationController.text;
    originalLandmark = landmarkController.text;
    originalPINCode = pINCodeController.text;
    originalCity = cityController.text;
    originalCompanyState = companyStateController.text;
    originalGSTNumber = gSTNumberController.text;
    originalAccountNumber = accountNumberController.text;
    originalIFSCCode = iFSCCodeController.text;

    isEditable = false;
    emit(EditSaved());
  }
}