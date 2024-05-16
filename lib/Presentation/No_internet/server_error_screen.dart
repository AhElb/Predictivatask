import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:predictiva/Presentation/Home_screen/home_screen.dart';
import 'package:predictiva/constants/colors.dart';
import 'package:predictiva/utils/connectionStatusSingleton.dart';

class ServerErrorScreen extends StatefulWidget {
  static const id = 'NoNetworkConnectionScreen';
  final String? data;

  const ServerErrorScreen({this.data});

  @override
  _ServerErrorScreenState createState() => _ServerErrorScreenState();
}

class _ServerErrorScreenState extends State<ServerErrorScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          statusBarColor: AppColors.primaryColor,
          systemNavigationBarColor: AppColors.primaryColor),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          // resizeToAvoidBottomPadding: false, // this avoids the overflow error
          body: SafeArea(
            bottom: false,
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15),
                    Text(
                      'Server Error',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () async {
                        if (await ConnectionStatusSingleton.getInstance()
                            .isConnectedToInternet()) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                              (route) => false);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Please check network!'),
                          ));
                        }
                      },
                      child: Icon(
                        Icons.refresh,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Try again',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Some thing went wrong on server\nPlease try again later',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      widget.data!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
