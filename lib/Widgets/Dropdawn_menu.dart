import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:predictiva/Models/open_orderModel.dart';
import 'package:predictiva/constants/colors.dart';
import 'package:predictiva/utils/Validations.dart';

class Dropdownmenue extends StatefulWidget {
  NewProjectForm? controller;
  final String hintText;
  final List droplist;

  final String? Function(String?)? validator;

  final Widget? suffixicon;

  Dropdownmenue({
    super.key,
    this.controller,
    required this.hintText,
    required this.droplist,
    this.suffixicon,
    this.validator,
  });

  @override
  _DropdownmenueState createState() => _DropdownmenueState();
}

class _DropdownmenueState extends State<Dropdownmenue> {
  @override
  Widget build(BuildContext context) {
    List droplist = widget.droplist.toSet().toList();

    return Container(
        child: DropdownButtonFormField(
      dropdownColor: AppColors.appblack,
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
      style: TextStyle(
          fontSize: 12,
          fontFamily: 'inter',
          height: 1,
          color: AppColors.whitecolor,
          fontWeight: FontWeight.w400),
      items: droplist.map((label) {
        return DropdownMenuItem(
          child: Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    label,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'inter',
                        height: 1,
                        color: AppColors.whitecolor,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )),
          value: label,
          onTap: () {
            setState(() {
              widget.controller!.coinvalue = label;
            });
          },
        );
      }).toList(),
      onChanged: (value) {
        widget.controller!.coinvalue = value.toString();
      },
    ));
  }
}
