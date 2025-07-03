import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  String? labelText;
  String? hintText;
  AppTextFormField({super.key, this.labelText, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText ?? 'Email Address',
        labelStyle: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
        hintText: hintText ?? 'kolohe9031@paldept.co',
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey.shade600, width: 1.2),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.black87, fontSize: 16),
    );
  }
}
