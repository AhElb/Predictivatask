import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:predictiva/Models/Portfolio_model.dart';
import 'package:predictiva/Models/open_orderModel.dart';
import 'package:predictiva/Network/network_manger.dart';
import 'package:predictiva/constants/endpoints.dart';
import 'package:predictiva/utils/api_exception.dart';

class Apprespoatery {
  Future Getportfolio() async {
    try {
      Map<String, dynamic> bodyData = {};
      print(bodyData);

      Response? response = await NetworkManager().callApi(
          method: HttpMethod.Get,
          body: bodyData,
          urlEndPoint: ApiEndPoints.portfolio);

      print("response : " + response.toString());

      if (response!.statusCode == 200) {
        return PortfolioModel.fromJson(response.data);
      }
    } on ApiException catch (e) {
      print(e);
      throw (e);
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future Getorders() async {
    try {
      Map<String, dynamic> bodyData = {};
      print(bodyData);

      Response? response = await NetworkManager().callApi(
          method: HttpMethod.Get,
          body: bodyData,
          urlEndPoint: ApiEndPoints.orders);

      print("response : " + response.toString());

      if (response!.statusCode == 200) {
        return OrderModel.fromJson(response.data);
      }
    } on ApiException catch (e) {
      print(e);
      throw (e);
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  List<List<Order>> chunk(List<Order>? array, int size) {
    List<List<Order>> chunks = [];
    int i = 0;
    while (i < array!.length) {
      int j = i + size;
      chunks.add(array.sublist(i, j > array.length ? array.length : j));
      i = j;
    }
    return chunks;
  }
}
