import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:predictiva/Models/Portfolio_model.dart';
import 'package:predictiva/Models/open_orderModel.dart';
import 'package:predictiva/Respoatery/App_respoatery.dart';
import 'package:predictiva/constants/colors.dart';
import 'package:predictiva/utils/api_exception.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initi()) {
    on<AppEvent>(mapEventToState);
  }

  Apprespoatery _apprespoatery = new Apprespoatery();
  List<List<Order>> orderslist = [];

  int curruntpage = 0;
  double pages = 0;
  List<Order> fixedlist = [];

  List coins = [];

  void mapEventToState(AppEvent event, Emitter<AppState> emit) async {
    if (event is GetportfoliEvent) {
      emit(state.update(isloading: true));

      try {
        PortfolioModel portfolioModel = await _apprespoatery.Getportfolio();

        emit(state.update(isloading: false, portfolioModel: portfolioModel));
      } on ApiException catch (e) {
        print(e);
        emit(state.update(isloading: false));
        Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: AppColors.redcolor,
            timeInSecForIosWeb: 1,
            textColor: AppColors.whitecolor,
            fontSize: 16.0);
      } catch (e) {
        print(e);
        emit(state.update(isloading: false));
      }
    } else if (event is GetopenordersEvent) {
      emit(state.update(isloading: true));

      try {
        OrderModel orderModel = await _apprespoatery.Getorders();

        pages = orderModel.data!.orders!.length / 5;

        orderslist = _apprespoatery.chunk(orderModel.data!.orders!, 5);

        fixedlist = orderModel.data!.orders!;

        emit(state.update(
            isloading: false,
            orderslist: orderslist[curruntpage],
            coins: fixedlist,
            curruntpage: curruntpage,
            filteron: false,
            listlength: orderModel.data!.orders!.length,
            pages: pages.toInt()));
      } on ApiException catch (e) {
        print(e);
        emit(state.update(isloading: false));
        Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: AppColors.redcolor,
            timeInSecForIosWeb: 1,
            textColor: AppColors.whitecolor,
            fontSize: 16.0);
      } catch (e) {
        print(e);
        emit(state.update(isloading: false));
      }
    } else if (event is Movetopageevent) {
      emit(state.update(isloading: true));

      curruntpage = event.pagenum;

      emit(state.update(
          isloading: false,
          orderslist: orderslist[event.pagenum],
          curruntpage: event.pagenum,
          pages: pages.toInt()));

      try {} catch (e) {
        print(e);
        emit(state.update(isloading: false));
      }
    } else if (event is FilterEvent) {
      emit(state.update(isloading: true));

      final list2 = fixedlist.where((element) {
        final symbol = element.symbol!.toLowerCase();
        final price = element.price.toString();
        final date =
            DateTime.fromMillisecondsSinceEpoch(element.creationtime! * 1000);

        final searcsymbol = event.symbol!.toLowerCase();
        final searcprice = event.price!.toLowerCase();

        final startdate = event.startdate;
        final enddate = event.enddate;

        if (startdate == null && enddate == null) {
          return symbol.contains(searcsymbol) && price.contains(searcprice);
        } else if (enddate == null) {
          return symbol.contains(searcsymbol) &&
              price.contains(searcprice) &&
              date.isAfter(startdate!);
        } else if (startdate == null) {
          return symbol.contains(searcsymbol) &&
              price.contains(searcprice) &&
              date.isBefore(enddate!);
        } else {
          return symbol.contains(searcsymbol) &&
              price.contains(searcprice) &&
              date.isAfter(startdate!) &&
              date.isBefore(enddate!);
        }
      }).toList();

      log(list2.length.toString());
      log(fixedlist.length.toString());

      orderslist = _apprespoatery.chunk(list2, 5);

      pages = list2.length / 5;

      final x = list2.length % 5;

      pages = x == 0 ? pages : pages + 1;

      curruntpage = 0;
      if (list2.length > 0) {
        emit(state.update(
            isloading: false,
            orderslist: orderslist[curruntpage],
            pages: pages.toInt(),
            curruntpage: curruntpage,
            filteron: event.clearfilter,
            listlength: list2.length));
      } else {
        emit(state.update(
            isloading: false,
            orderslist: [],
            filteron: event.clearfilter,
            pages: pages.toInt(),
            curruntpage: curruntpage,
            listlength: list2.length));
      }
    }
  }
}
