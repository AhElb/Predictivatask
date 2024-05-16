import 'package:flutter/material.dart';
import 'package:predictiva/constants/colors.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final Function()? ontap;
  final bool obscureText;
  final int? maxLength;

  final bool readonly;

  final String? Function(String?)? validator;

  final Widget? suffixicon;

  const MyTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.readonly = false,
    this.ontap,
    this.keyboardType,
    this.obscureText = false,
    this.maxLength,
    this.suffixicon,
    this.validator,
  });

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        readOnly: widget.readonly,
        onTap: widget.ontap,
        style: TextStyle(
            fontSize: 14,
            fontFamily: 'inter',
            height: 1.45,
            color: AppColors.whitecolor,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            hintText: widget.hintText,
            suffixIcon: widget.suffixicon,
            hintStyle: TextStyle(
                fontSize: 14,
                fontFamily: 'inter',
                height: 1.45,
                color: AppColors.texthint,
                fontWeight: FontWeight.w400),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(width: 1, color: AppColors.containerborder))),
      ),
    );
  }
}
