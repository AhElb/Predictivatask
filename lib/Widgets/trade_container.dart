import 'package:flutter/material.dart';
import 'package:predictiva/constants/colors.dart';
import 'package:intl/intl.dart';

class Tradecontainer extends StatelessWidget {
  String coinlabel;
  String type;
  String price;

  int date;

  Tradecontainer(
      {super.key,
      required this.coinlabel,
      required this.price,
      required this.type,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, right: 16, bottom: 16, left: 0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: AppColors.containerborder))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coinlabel,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'inter',
                    height: 1.45,
                    color: AppColors.whitecolor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                    color: AppColors.typecolor,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.redcolor)),
                child: Text(
                  type,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'inter',
                      height: 1.45,
                      color: AppColors.textred,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'inter',
                    height: 1.45,
                    color: AppColors.whitecolor,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 9,
              ),
              Text(
                DateFormat('d MMM, yyyy')
                    .format(DateTime.fromMillisecondsSinceEpoch(date * 1000))
                    .toString(),
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'inter',
                    height: 1.45,
                    color: AppColors.softgrey,
                    fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }
}
