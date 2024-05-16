import 'package:flutter/material.dart';
import 'package:predictiva/constants/colors.dart';
import 'package:intl/intl.dart';
import 'package:predictiva/utils/captlize.dart';
import 'package:predictiva/utils/media_query_values.dart';

class TableRowwidgit {
  static tablerow({
    String? coinlabel,
    String? action,
    String? type,
    String? price,
    double? quantiti,
    int? date,
    required BuildContext context,
  }) {
    double sizeHeight = context.height;
    double sizeWidth = context.width;

    return Container(
        margin: EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: AppColors.containerborder)),
        child: Row(children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                left: sizeWidth * 0.0224,
              ),
              padding: EdgeInsets.symmetric(vertical: 0.0154 * sizeWidth),
              child: Text(
                coinlabel!,
                style: TextStyle(
                  color: AppColors.whitecolor,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'inter',
                  fontSize: sizeWidth * 0.0112,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0.0154 * sizeWidth),
              child: Text(
                price!,
                style: TextStyle(
                  color: AppColors.whitecolor,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'inter',
                  fontSize: sizeWidth * 0.0112,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0.0154 * sizeWidth),
              child: Text(
                type!,
                style: TextStyle(
                  color: AppColors.whitecolor,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'inter',
                  fontSize: sizeWidth * 0.0112,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0.0154 * sizeWidth),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: sizeWidth * 0.047,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.typecolor,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1, color: AppColors.textred)),
                  child: Text(
                    action!.capitalize(),
                    style: TextStyle(
                      color: AppColors.textred,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'inter',
                      fontSize: sizeWidth * 0.0112,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0.0154 * sizeWidth),
              child: Text(
                quantiti.toString(),
                style: TextStyle(
                  color: AppColors.whitecolor,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'inter',
                  fontSize: sizeWidth * 0.0112,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0.0154 * sizeWidth),
              child: Text(
                DateFormat('d MMM, yyyy')
                    .format(DateTime.fromMillisecondsSinceEpoch(date! * 1000))
                    .toString(),
                style: TextStyle(
                  color: AppColors.whitecolor,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'inter',
                  fontSize: sizeWidth * 0.0112,
                ),
              ),
            ),
          ),
        ]));
  }
}
