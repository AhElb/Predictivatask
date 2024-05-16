import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:predictiva/Controller/bloc/app_bloc.dart';
import 'package:predictiva/Models/open_orderModel.dart';
import 'package:predictiva/Widgets/Cutom_textfield.dart';
import 'package:predictiva/Widgets/Dropdawn_menu.dart';
import 'package:predictiva/Widgets/Dropdown_text.dart';
import 'package:predictiva/constants/colors.dart';
import 'package:predictiva/utils/Validations.dart';

class Filterwidget {
  static filtertable({
    required BuildContext context,
    required AppBloc appBloc,
    NewProjectForm? form,
    List<Order>? coins,
    bool? filteron,
  }) {
    List droplist = [];

    coins!.forEach(
      (element) {
        element.symbol!.replaceAll('USDT', '');

        droplist.add(element.symbol!.replaceAll('USDT', ''));
      },
    );

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
              insetAnimationDuration: Duration(milliseconds: 300),
              insetAnimationCurve: Curves.easeIn,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 5,
              shadowColor: Color(0xff000000).withOpacity(0.4),
              backgroundColor: Colors.transparent,
              child: Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.dropdawnbg,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff000000).withOpacity(0.4),
                          blurRadius: 52,
                          spreadRadius: 0,
                          offset: Offset(0, 24))
                    ],
                    borderRadius: BorderRadius.circular(8)),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Dropdownmenue(
                          hintText:
                              form!.coinvalue == '' ? 'Symbol' : form.coinvalue,
                          controller: form,
                          droplist: droplist),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextField(
                        controller: form!.pricecomtroller,
                        hintText: 'Price',
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Date range',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'inter',
                            height: 1.45,
                            color: AppColors.whitecolor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      MyTextField(
                        hintText: 'Start date',
                        readonly: true,
                        controller: form.startdatecontroller,
                        suffixicon: Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          child: Image.asset('assets/icons/calendar.png'),
                        ),
                        ontap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.utc(1990),
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            lastDate: DateTime.utc(2100),

                            //DateTime.now() - not to allow to choose before today.
                          );

                          if (pickedDate != null) {
                            form.startdate = pickedDate;
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            form.startdatecontroller.text = formattedDate;
                          } else {}
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextField(
                        hintText: 'End date',
                        controller: form.enddatecontroller,
                        suffixicon: Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          child: Image.asset('assets/icons/calendar.png'),
                        ),
                        readonly: true,
                        ontap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.utc(1990),
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            lastDate: DateTime.utc(2100),

                            //DateTime.now() - not to allow to choose before today.
                          );

                          if (pickedDate != null) {
                            form.enddate = pickedDate;
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            form.enddatecontroller.text = formattedDate;
                          } else {}
                        },
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          filteron == true
                              ? Container(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        appBloc.add(FilterEvent(
                                            symbol: '',
                                            price: '',
                                            clearfilter: false,
                                            startdate: null,
                                            enddate: null));
                                        form.coinvalue = '';
                                        form.pricecomtroller.text = '';
                                        form.enddatecontroller.text = '';
                                        form.startdatecontroller.text = '';
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.secondaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          )),
                                      child: Text(
                                        'Clear filter',
                                        style: TextStyle(
                                            fontFamily: 'inter',
                                            fontSize: 14,
                                            color: AppColors.whitecolor,
                                            fontWeight: FontWeight.w600,
                                            height: 1.45),
                                      )),
                                )
                              : SizedBox(),
                          Container(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                                onPressed: () {
                                  log(form.coinvalue);
                                  appBloc.add(FilterEvent(
                                      symbol: form.coinvalue,
                                      price: form.pricecomtroller.text,
                                      clearfilter: true,
                                      startdate: form.startdate,
                                      enddate: form.enddate));
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.buttoncolor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                child: Text(
                                  'Filter table',
                                  style: TextStyle(
                                      fontFamily: 'inter',
                                      fontSize: 16,
                                      color: AppColors.whitecolor,
                                      fontWeight: FontWeight.w600,
                                      height: 1.45),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ));
        });
  }
}
