import 'package:flutter/material.dart';
import 'package:predictiva/constants/colors.dart';
import 'package:predictiva/utils/media_query_values.dart';

class WebPortfoliowidgit extends StatelessWidget {
  String label;
  String value;
  String? percentage;

  bool? last = false;

  WebPortfoliowidgit(
      {super.key,
      required this.label,
      required this.value,
      this.percentage,
      this.last});

  @override
  Widget build(BuildContext context) {
    double sizeHeight = context.height;
    double sizeWidth = context.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      width: double.infinity,
      decoration: BoxDecoration(
          border: last == true
              ? null
              : Border(
                  right:
                      BorderSide(width: 1, color: AppColors.containerborder))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 0.0112 * sizeWidth,
                fontFamily: 'inter',
                color: AppColors.labelcolor,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: 0.0168 * sizeWidth,
                      fontFamily: 'inter',
                      color: AppColors.whitecolor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              percentage == null
                  ? SizedBox()
                  : Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                          color: AppColors.appblack,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: AppColors.redcolor)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              height: 0.0112 * sizeWidth,
                              width: 0.0112 * sizeWidth,
                              child: Image.asset(
                                  'assets/icons/arrow-down-left.png')),
                          Text(
                            '${percentage}%',
                            style: TextStyle(
                                fontSize: 0.0098 * sizeWidth,
                                fontFamily: 'inter',
                                height: 1.45,
                                color: AppColors.textred,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )
            ],
          )
        ],
      ),
    );
  }
}
