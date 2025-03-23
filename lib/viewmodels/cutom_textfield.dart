import 'package:flutter/material.dart';
import 'package:sente_pilot/utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool visibility;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {super.key,
      required this.labelText,
      required this.prefixIcon,
      this.suffixIcon,
      required this.controller,
      this.validator,
      this.visibility = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        cursorColor: AppColors.text,
        obscureText: visibility,
        style: const TextStyle(color: AppColors.text),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(
            prefixIcon,
            color: AppColors.primary,
          ),
          suffixIcon: suffixIcon,
          suffixIconColor: AppColors.primary,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 4),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 4),
          ),
        ),
        validator: validator);
  }
}
