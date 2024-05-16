import 'package:flutter/material.dart';

class NewProjectForm {
  TextEditingController pricecomtroller = TextEditingController();

  TextEditingController startdatecontroller = TextEditingController();
  TextEditingController enddatecontroller = TextEditingController();
  String coinvalue = '';
  DateTime? startdate;
  DateTime? enddate;

  String? validateDate(String? value) {
    if (value!.isEmpty) {
      return 'Date is required';
    }
    return null;
  }
}
