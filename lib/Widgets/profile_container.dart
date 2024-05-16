import 'package:flutter/material.dart';
import 'package:predictiva/constants/colors.dart';

class Profilecontainer extends StatelessWidget {
  String label;
  String value;
  String? percentage;

  bool? last = false;

  Profilecontainer(
      {super.key,
      required this.label,
      required this.value,
      this.percentage,
      this.last});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        border: last == true
            ? null
            : Border(
                bottom: BorderSide(width: 1, color: AppColors.containerborder)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'inter',
                color: AppColors.labelcolor,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'inter',
                    color: AppColors.whitecolor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 8,
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
                              height: 16,
                              width: 16,
                              child: Image.asset(
                                  'assets/icons/arrow-down-left.png')),
                          Text(
                            '${percentage}%',
                            style: TextStyle(
                                fontSize: 14,
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
