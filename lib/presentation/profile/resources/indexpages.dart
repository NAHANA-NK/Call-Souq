import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginss/presentation/profile/resources/resource.dart';
import '../cubit/profile_cubit.dart';

class PersonalDetailsIndex extends StatelessWidget {
  PersonalDetailsIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        final cubit = context.read<HomeScreenCubit>();
        final bool isReadOnly = !cubit.isEditable;
        File? imageFile;
        if (state is HomeScreenImagePicked) {
          imageFile = state.image;
        }
        return Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Personal Details",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          cubit.editMode();
                        },
                        icon: state is TextEditable
                            ? SizedBox()
                            : Icon(Icons.edit))
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffEEEEEE),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (cubit.isEditable)
                          Padding(
                            padding:
                            const EdgeInsets.only(top: 8.0, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: imageFile != null
                                      ? FileImage(imageFile)
                                      : NetworkImage(cubit.profileUrl),
                                ),

                                Column(
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        cubit.pickImage(ImageSource.camera);
                                      },
                                      icon: Icon(Icons.camera_alt),
                                      label: Text(
                                        "Take a Photo",
                                        style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        cubit.pickImage(ImageSource.gallery);
                                      },
                                      icon: Icon(Icons.photo_library_outlined),
                                      label: Text("Choose Photo",
                                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700)),
                                    ),
                                  ],
                                  ),
                              ],
                            ),
                          ),
                        DetailRow(
                          label: "Company Name",
                          controller: cubit.companyNameController,
                          isReadOnly: isReadOnly,
                        ),
                        DetailRow(
                          label: "Whatsapp Number",
                          controller: cubit.whatsappNumberController,
                          isReadOnly: isReadOnly,
                        ),
                        DetailRow(
                          label: "Address",
                          controller: cubit.addressController,
                          isReadOnly: isReadOnly,
                        ),
                        DetailRow(
                          label: "Place",
                          controller: cubit.placeController,
                          isReadOnly: isReadOnly,
                        ),
                        DetailRow(
                          label: "District",
                          controller: cubit.districtController,
                          isReadOnly: isReadOnly,
                        ),
                        DetailRow(
                          label: "State",
                          controller: cubit.personStateController,
                          isReadOnly: isReadOnly,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            (cubit.isEditable)
                ?
            SaveAndCancel(cancelOnTap: () {
              cubit.cancelEdit();
            }, saveOnTap: () {
              cubit.saveEdit();
               cubit.putPersonalDetails(context);
            })
                : SizedBox()
          ],
        );
      },
    );
  }
}

class CompanyIndex extends StatelessWidget {
  const CompanyIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        final cubit = context.read<HomeScreenCubit>();
        final bool isReadOnly = state is TextEditable ? false : true;

        return Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Company Details",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          cubit.editMode();
                        },
                        icon: state is TextEditable
                            ? SizedBox()
                            : Icon(Icons.edit))
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffEEEEEE),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DetailRow(
                          label: 'Room/Floor/Building Number',
                          controller: cubit.roomFloorBuildingNumberController,
                          isReadOnly: isReadOnly,
                        ),
                        DetailRow(
                            label: "Location/Street",
                            controller: cubit.locationController,
                            isReadOnly: isReadOnly),
                        DetailRow(
                            label: "Landmark",
                            controller: cubit.landmarkController,
                            isReadOnly: isReadOnly),
                        DetailRow(
                            label: "PIN Code",
                            controller: cubit.pINCodeController,
                            isReadOnly: isReadOnly),
                        DetailRow(
                            label: "City",
                            controller: cubit.cityController,
                            isReadOnly: isReadOnly),
                        DetailRow(
                            label: "State",
                            controller: cubit.companyStateController,
                            isReadOnly: isReadOnly)
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            state is TextEditable
                ? SaveAndCancel(cancelOnTap: () {
              cubit.cancelEdit();
            }, saveOnTap: () {
                  cubit.putCompanyDetails(context);
            })
                : SizedBox()
          ],
        );
      },
    );
  }
}

class SecurityIndex extends StatelessWidget {
  const SecurityIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        final cubit = context.read<HomeScreenCubit>();

        return Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tax Details",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          cubit.spacialEdit(1);
                        },
                        icon: state is sacialEditState && state.item == 1
                            ? SizedBox()
                            : Icon(Icons.edit))
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffEEEEEE),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DetailRow(
                          label: "GSTIN Number",
                          controller: cubit.gSTNumberController,
                          isReadOnly:
                          state is sacialEditState && state.item == 1
                              ? false
                              : true,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                state is sacialEditState && state.item == 1
                    ? SaveAndCancel(cancelOnTap: () {
                  cubit.cancelEdit();
                }, saveOnTap: () {
                  cubit.saveEdit();
                })
                    : SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Bank Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          cubit.cancelEdit();
                          cubit.spacialEdit(2);
                        },
                        icon: state is TextEditable
                            ? SizedBox()
                            : Icon(Icons.edit))
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffEEEEEE),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Account Number",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        CostmTextFormField(
                          controller: cubit.accountNumberController,
                          isReadOnly:
                          state is sacialEditState && state.item == 2
                              ? false
                              : true,
                        ),
                        Text(
                          "IFSC Code",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        CostmTextFormField(
                          controller: cubit.iFSCCodeController,
                          isReadOnly:
                          state is sacialEditState && state.item == 2
                              ? false
                              : true,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            state is sacialEditState && state.item == 2
                ? SaveAndCancel(cancelOnTap: () {
              cubit.cancelEdit();
            }, saveOnTap: () {
              cubit.saveEdit();
            })
                : SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Password",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right))
              ],
            ),
          ],
        );
      },
    );
  }
}