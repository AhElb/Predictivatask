import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Responsivelayout extends StatelessWidget {
  final Widget mobilebody;
  final Widget desktopbody;

  Responsivelayout(
      {super.key, required this.mobilebody, required this.desktopbody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 650) {
        return mobilebody;
      } else {
        return desktopbody;
      }
    });
  }
}
