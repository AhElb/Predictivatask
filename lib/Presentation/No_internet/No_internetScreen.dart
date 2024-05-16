import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:predictiva/Presentation/Home_screen/home_screen.dart';
import 'package:predictiva/constants/colors.dart';
import 'package:predictiva/utils/connectionStatusSingleton.dart';

class NoNetworkConnectionScreen extends StatefulWidget {
  static const id = 'NoNetworkConnectionScreen';
  @override
  _NoNetworkConnectionScreenState createState() =>
      _NoNetworkConnectionScreenState();
}

class _NoNetworkConnectionScreenState extends State<NoNetworkConnectionScreen> {
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
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              backgroundColor: Colors.white,
              resizeToAvoidBottomInset: false,
              // resizeToAvoidBottomPadding: false, // this avoids the overflow error
              body: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(
                        Icons
                            .signal_wifi_statusbar_connected_no_internet_4_rounded,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Poor connection or no network available.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'pop'),
                    ),
                    SizedBox(height: 25),
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
                            content: Text(
                              'Please check network!',
                            ),
                          ));
                        }
                      },
                      child: Icon(
                        Icons.refresh,
                        size: 50,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
