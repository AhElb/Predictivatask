import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:predictiva/Controller/bloc/app_bloc.dart';
import 'package:predictiva/Models/Portfolio_model.dart';
import 'package:predictiva/Models/open_orderModel.dart';
import 'package:predictiva/Widgets/Desktop_widgets/filter_web_wedgit.dart';
import 'package:predictiva/Widgets/Desktop_widgets/table_row.dart';
import 'package:predictiva/Widgets/Desktop_widgets/web_portfolio_widgit.dart';
import 'package:predictiva/Widgets/Dropdown_text.dart';
import 'package:predictiva/Widgets/Filter_widget.dart';
import 'package:predictiva/Widgets/cutom_progress_bar.dart';
import 'package:predictiva/Widgets/profile_container.dart';
import 'package:predictiva/Widgets/trade_container.dart';
import 'package:predictiva/constants/colors.dart';
import 'package:predictiva/utils/Validations.dart';
import 'package:predictiva/utils/media_query_values.dart';

class DesktopScreen extends StatefulWidget {
  DesktopScreen({
    super.key,
  });

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  int listlenght = 0;
  double pages = 0;
  final NewProjectForm form = NewProjectForm();

  AppBloc _appBloc = new AppBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _appBloc.add(GetportfoliEvent());
    _appBloc.add(GetopenordersEvent());
  }

  @override
  Widget build(BuildContext context) {
    double sizeHeight = context.height;
    double sizeWidth = context.width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: AppColors.primaryColor,
            systemNavigationBarColor: AppColors.primaryColor),
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: BlocBuilder(
              bloc: _appBloc,
              builder: (context, AppState state) {
                return ProgressHUD(
                  inAsyncCall: state.isloading,
                  child: ListView(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 79,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xff3E3F48)))),
                      ),
                      SizedBox(
                        height: 52,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: sizeWidth * 0.03641),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi Robin,',
                              style: TextStyle(
                                  color: AppColors.whitecolor,
                                  fontSize: 24,
                                  fontFamily: 'inter',
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Here is an overview of your account activities.',
                              style: TextStyle(
                                  color: AppColors.labelcolor,
                                  fontSize: 16,
                                  fontFamily: 'inter',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 36,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: sizeWidth * 0.03641),
                        decoration: BoxDecoration(
                            color: AppColors.maincontainrcolor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 1, color: AppColors.containerborder)),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 34),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    margin: EdgeInsets.only(
                                        left: sizeWidth * 0.070),
                                    child: WebPortfoliowidgit(
                                        label: 'Balance',
                                        value: r'$'
                                            '${state.portfolioModel!.data!.portfolio!.balance}'),
                                  )),
                                  Expanded(
                                      child: Container(
                                    margin: EdgeInsets.only(
                                        left: sizeWidth * 0.0441),
                                    child: WebPortfoliowidgit(
                                        label: 'Profits',
                                        value: r'$'
                                            '${state.portfolioModel!.data!.portfolio!.profit}',
                                        percentage: state.portfolioModel!.data!
                                            .portfolio!.profitpercentage
                                            .toString()),
                                  )),
                                  Expanded(
                                      child: Container(
                                    margin: EdgeInsets.only(
                                        left: sizeWidth * 0.0301),
                                    child: WebPortfoliowidgit(
                                      label: 'Assets',
                                      value: state.portfolioModel!.data!
                                          .portfolio!.assets
                                          .toString(),
                                      last: true,
                                    ),
                                  ))
                                ],
                              ),
                            ),
                            Divider(
                              color: AppColors.containerborder,
                              thickness: 1,
                              endIndent: 0,
                              height: 0,
                              indent: 0,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 32, horizontal: 24),
                              decoration: BoxDecoration(
                                color: AppColors.appblack,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                        'assets/icons/warning-circle.png'),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                      child: Text(
                                    'This subscription expires in a month',
                                    style: TextStyle(
                                        color: AppColors.valuecolor,
                                        fontSize: 0.0168 * sizeWidth,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'inter'),
                                  ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: sizeWidth * 0.03641),
                          padding: EdgeInsets.symmetric(
                              vertical: 24, horizontal: (0.0223 * sizeWidth)),
                          decoration: BoxDecoration(
                              color: AppColors.maincontainrcolor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: 1, color: AppColors.containerborder)),
                          child: Column(children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Open trades',
                                    style: TextStyle(
                                        color: AppColors.whitecolor,
                                        fontSize: sizeWidth * 0.014,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'inter'),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Filterwebwidgit.filtertable(
                                          context: context,
                                          appBloc: _appBloc,
                                          coins: state.coins,
                                          filteron: state.filteron,
                                          form: form);
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: sizeWidth * 0.06442,
                                          height: sizeWidth * 0.0336,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color:
                                                      AppColors.containerborder,
                                                  width: 1)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Filter',
                                                style: TextStyle(
                                                    color: AppColors.labelcolor,
                                                    fontSize:
                                                        sizeWidth * 0.0112,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'inter'),
                                              ),
                                              SizedBox(
                                                width: 1,
                                              ),
                                              Container(
                                                width: sizeWidth * 0.0168,
                                                height: sizeWidth * 0.0168,
                                                alignment: Alignment.center,
                                                child: Image.asset(
                                                  'assets/icons/filter-list.png',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        state.filteron == true
                                            ? Container(
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    color:
                                                        AppColors.buttoncolor),
                                              )
                                            : SizedBox()
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: sizeWidth * 0.0112,
                            ),
                            Row(children: [
                              Expanded(
                                child: Container(
                                  margin:
                                      EdgeInsets.only(left: sizeWidth * 0.0224),
                                  child: Text(
                                    'Symbol',
                                    style: TextStyle(
                                      color: AppColors.valuecolor,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'inter',
                                      fontSize: sizeWidth * 0.0112,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    'Price',
                                    style: TextStyle(
                                      color: AppColors.valuecolor,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'inter',
                                      fontSize: sizeWidth * 0.0112,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    'Type',
                                    style: TextStyle(
                                      color: AppColors.valuecolor,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'inter',
                                      fontSize: sizeWidth * 0.0112,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    'Action',
                                    style: TextStyle(
                                      color: AppColors.valuecolor,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'inter',
                                      fontSize: sizeWidth * 0.0112,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    'Quantity',
                                    style: TextStyle(
                                      color: AppColors.valuecolor,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'inter',
                                      fontSize: sizeWidth * 0.0112,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    'Date',
                                    style: TextStyle(
                                      color: AppColors.valuecolor,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'inter',
                                      fontSize: sizeWidth * 0.0112,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                            SizedBox(
                              height: 24,
                            ),
                            for (int i = 0;
                                state.orderslist!.length > 5
                                    ? i < 5
                                    : i < state.orderslist!.length;
                                i++)
                              TableRowwidgit.tablerow(
                                  context: context,
                                  coinlabel: state.orderslist![i].symbol,
                                  date: state.orderslist![i].creationtime,
                                  price: state.orderslist![i].price.toString(),
                                  action: state.orderslist![i].side,
                                  type: state.orderslist![i].type,
                                  quantiti: state.orderslist![i].quantity),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${state.curruntpage! + 1} - ${state.pages} of ${state.listlength}',
                                    style: TextStyle(
                                        color: AppColors.labelcolor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'inter'),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            log(state.curruntpage.toString());
                                            if (state.curruntpage! > 0) {
                                              _appBloc.add(Movetopageevent(
                                                  pagenum:
                                                      state.curruntpage! - 1));
                                            }
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 24,
                                            height: 24,
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: AppColors
                                                        .containerborder)),
                                            child: Icon(
                                              Icons.arrow_back_ios_new_rounded,
                                              size: 12,
                                              color: AppColors.softgrey,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            log(state.curruntpage.toString());

                                            if (state.curruntpage! + 1 <
                                                state.pages!) {
                                              _appBloc.add(Movetopageevent(
                                                  pagenum:
                                                      state.curruntpage! + 1));
                                            }
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 24,
                                            height: 24,
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: AppColors
                                                        .containerborder)),
                                            child: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 12,
                                              color: AppColors.softgrey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ])),
                      SizedBox(
                        height: 121,
                      )
                    ],
                  ),
                );
              }),
        ));
  }
}
