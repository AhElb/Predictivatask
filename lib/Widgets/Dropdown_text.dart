// import 'dart:developer';

// import 'package:dropdown_textfield/dropdown_textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:predictiva/constants/colors.dart';

// class Dropdowntextfield extends StatefulWidget {
//   SingleValueDropDownController? controller;
//   final String hintText;
//   final List<DropDownValueModel> droplist;

//   final String? Function(String?)? validator;

//   final Widget? suffixicon;

//   Dropdowntextfield({
//     super.key,
//     this.controller,
//     required this.hintText,
//     required this.droplist,
//     this.suffixicon,
//     this.validator,
//   });

//   @override
//   _DropdowntextfieldState createState() => _DropdowntextfieldState();
// }

// class _DropdowntextfieldState extends State<Dropdowntextfield> {
//   @override
//   Widget build(BuildContext context) {
//     List<DropDownValueModel> droplist = widget.droplist.toSet().toList();

//     log(droplist.length.toString());
//     return Container(
//       child: SingleChildScrollView(
//         child: DropDownTextField(
//           controller: widget.controller,
//           clearOption: true,
//           enableSearch: true,
//           listPadding: ListPadding(top: 5, bottom: 5),
//           padding: EdgeInsets.zero,
//           textStyle: TextStyle(
//               fontSize: 12,
//               fontFamily: 'inter',
//               height: 1,
//               color: AppColors.whitecolor,
//               fontWeight: FontWeight.w400),
//           textFieldDecoration: InputDecoration(
//               contentPadding:
//                   EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               hintText: widget.hintText,
//               suffixIcon: widget.suffixicon,
//               hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'inter',
//                   height: 1.45,
//                   color: AppColors.texthint,
//                   fontWeight: FontWeight.w400),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide:
//                       BorderSide(width: 1, color: AppColors.containerborder))),
//           dropDownItemCount: droplist.length,
//           dropDownList: droplist,
//         ),
//       ),
//     );
//   }
// }
