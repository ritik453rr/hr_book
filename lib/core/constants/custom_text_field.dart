import 'package:core_hr/core/constants/app_colors.dart';
import 'package:core_hr/core/text/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          fontFamily: AppFonts.roboto,
          color: AppColors.c1A1C1E.withValues(alpha: 0.35),
        ),
        border: OutlineInputBorder(),
      ),
    );
  }
}
