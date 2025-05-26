import 'package:flutter/material.dart';

class ProfileButtons extends StatelessWidget {
  ProfileButtons({
    super.key,
    required this.text,
    required this.ontap,
    required this.isSelected,
  });

  String text;
  final VoidCallback ontap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? Color(0xff47BA82) : Color(0xFFEEEEEE)),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              text,
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}

class Heading1 extends StatelessWidget {
  const Heading1({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}

class Heading2 extends StatelessWidget {
  const Heading2({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(name,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500));
  }
}

// A reusable widget for each detail
class DetailRow extends StatelessWidget {
  final String label;
  final bool isReadOnly;
  final TextEditingController controller;
  const DetailRow({
    super.key,
    required this.label,
    required this.controller,
    required this.isReadOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          CostmTextFormField(isReadOnly: isReadOnly, controller: controller)
        ],
      ),
    );
  }
}

class CostmTextFormField extends StatelessWidget {
  const CostmTextFormField(
      {super.key, required this.isReadOnly, required this.controller});

  final bool isReadOnly;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        readOnly: isReadOnly,
        controller: controller,
        style: TextStyle(
            color: Color(0xff828282),
            fontWeight: FontWeight.w500,
            fontSize: 16),
        decoration: InputDecoration(
          filled: true,
          fillColor: isReadOnly?Colors.transparent:Colors.white,
          border: isReadOnly
              ? InputBorder.none
              : OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none
          ),
        ),
      ),
    );
  }
}

class SaveAndCancel extends StatelessWidget {
  const SaveAndCancel({super.key, required this.cancelOnTap, required this.saveOnTap});

  final VoidCallback cancelOnTap;
  final VoidCallback saveOnTap;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: cancelOnTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10, bottom: 10),
              child: Text(
                "Cancel",
                style:
                TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        InkWell(
          onTap:saveOnTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10, bottom: 10),
              child: Text(
                "Save",
                style:
                TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w600),
              ),
            ),
          ),
        )
      ],
    );
  }
}