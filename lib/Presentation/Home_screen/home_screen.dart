import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:predictiva/Controller/bloc/app_bloc.dart';
import 'package:predictiva/Models/open_orderModel.dart';
import 'package:predictiva/Presentation/Desktop_layout/Desktop_screen.dart';
import 'package:predictiva/Presentation/Mobile_layout/Mobile_screen.dart';
import 'package:predictiva/Responsive/responsive_layout.dart';
import 'package:predictiva/Widgets/Filter_widget.dart';
import 'package:predictiva/Widgets/cutom_progress_bar.dart';
import 'package:predictiva/Widgets/profile_container.dart';
import 'package:predictiva/Widgets/trade_container.dart';
import 'package:predictiva/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppBloc _appBloc = new AppBloc();
  List<Order?>? orders = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder(
            bloc: _appBloc,
            builder: (context, AppState state) {
              return ProgressHUD(
                inAsyncCall: state.isloading,
                child: Responsivelayout(
                    mobilebody: MobileScreen(), desktopbody: DesktopScreen()),
              );
            }));
  }
}
