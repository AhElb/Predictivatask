// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

class ApiException implements Exception {
  static const defaultErrorDetail = 'Something went wrong. Please try again.';
  DioError error;
  ApiException(
    this.error,
  ) {
    this.error = error;
  }
  String getDetail() {
    if (null == error.response) {
      return defaultErrorDetail;
    }
    if (!(null != error.response!.data && error.response!.data is Map)) {
      return defaultErrorDetail;
    }
    if (!error.response!.data.containsKey('errors')) {
      return defaultErrorDetail;
    }
    if (error.response!.data['errors'] is! List) {
      return defaultErrorDetail;
    }
    if (error.response!.data['errors'].length == 0) {
      return defaultErrorDetail;
    }
    print(error.response!.data['errors'][0].toString());
    return error.response!.data['errors'][0].toString();
  }

  @override
  String toString() {
    // TODO: implement toString
    return this.getDetail();
  }
}
