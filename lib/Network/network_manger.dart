import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:predictiva/Presentation/No_internet/No_internetScreen.dart';
import 'package:predictiva/Presentation/No_internet/server_error_screen.dart';
import 'package:predictiva/constants/App_constants.dart';
import 'package:predictiva/constants/endpoints.dart';
import 'package:predictiva/utils/connectionStatusSingleton.dart';

enum HttpMethod { Get, Post, Put, Patch, Delete }

class NetworkManager {
  static final NetworkManager _singleton = NetworkManager._internal();
  factory NetworkManager() {
    return _singleton;
  }
  NetworkManager._internal();

  Dio dio = Dio();
  void setDioOptions() {
    dio.options.contentType = Headers.jsonContentType;
  }

  Future<Response?> callApi({
    required HttpMethod method,
    required String urlEndPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? body,
    FormData? formData,
    bool isMedia = false,
  }) async {
    this.setDioOptions();
    var requestURL;
    requestURL = ApiEndPoints.baseUrl + urlEndPoint;

    print("Request URL: " + requestURL);

    if (await ConnectionStatusSingleton.getInstance().isConnectedToInternet()) {
      try {
        switch (method) {
          case HttpMethod.Get:
            return await dio.get(
              requestURL,
              queryParameters: queryParameters,
              options: options,
            );
            break;
          case HttpMethod.Post:
            Response response = await dio.post(
              requestURL,
              queryParameters: queryParameters,
              options: options,
              data: isMedia ? formData : body,
            );

            Map jsonResponse = jsonDecode(response.data);

            if (jsonResponse['status'] == 101) {
              // Application.navKey.currentState.push(
              //   MaterialPageRoute(builder: (context) => NoNetworkConnectionScreen()),
              // );

              print("jsonResponse['status']");
              print(response);
            } else {
              if (response.data.contains('!DOCTYPE html')) {
                try {
                  Appconstants.navKey.currentState!.push(
                    MaterialPageRoute(
                        builder: (context) => ServerErrorScreen(
                              data: response.data.toString(),
                            )),
                  );
                } catch (e) {
                  print(e);
                }
              } else {
                return response;
              }
            }

            break;
          case HttpMethod.Put:
            return await dio.put(
              requestURL,
              queryParameters: queryParameters,
              options: options,
              data: formData,
            );
            break;
          case HttpMethod.Patch:
            break;
          case HttpMethod.Delete:
            return await dio.delete(
              requestURL,
            );
            break;
        }
      } on DioError catch (error) {
        Map<String, dynamic> errorResponse = error.response!.data;

        Response errResponse = Response(
            data: errorResponse,
            statusCode: error.response!.statusCode,
            requestOptions: RequestOptions());
        return errResponse;
        // throw ApiException(error);
      }
    } else {
      print("Request URL11: " + requestURL);
      // CustomDialog.noNetWork(Application.navKey.currentContext);
      Appconstants.navKey.currentState!.push(
        MaterialPageRoute(builder: (context) => NoNetworkConnectionScreen()),
      );
      Response errResponses = Response(requestOptions: RequestOptions());

      return errResponses;
    }
    return null;
  }
}
