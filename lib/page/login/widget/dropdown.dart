import 'package:flutter/material.dart';


class DropdownTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final List<String> dropdownOptions;
  final Widget? prefixIcon; // New parameter for prefix icon

  const DropdownTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.dropdownOptions,
    this.prefixIcon, // Initialize prefixIcon parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color:Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButtonFormField<String>(
          value: controller.text.isEmpty ? null : controller.text,
          onChanged: (String? newValue) {
            controller.text = newValue ?? '';
          },
          items: dropdownOptions.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 14),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.green),
            prefixIcon: prefixIcon, // Use prefixIcon parameter
          ),
        ),
      ),
    );
  }
}
