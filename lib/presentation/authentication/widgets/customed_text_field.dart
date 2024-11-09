import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/utils/text_styles.dart';

typedef Validator = String? Function(String?);

class CustomedTextField extends StatelessWidget {
  CustomedTextField(
      {super.key,
        required this.hintText,
        this.validator,
        this.controller,
        this.isSecureText = false,
        this.keyboardType = TextInputType.text});

  String hintText;
  Validator? validator;
  bool isSecureText;
  TextEditingController? controller;
  TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isSecureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: const BorderSide(color: Colors.red)),
          hintText: hintText,
          hintStyle: LightTxtStyles.hintRegister),
    );
  }
}