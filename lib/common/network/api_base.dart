import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:expo_app/common/network/dio_exception.dart';
import 'package:expo_app/core/app_extension.dart';

abstract mixin class ApiBase<T> {
  //Method template for checking whether api is success or not
  Future<bool> _requestMethodTemplate(Future<Response<dynamic>> apiCallback) async {
    final Response response = await apiCallback;
    if (response.statusCode != null && response.statusCode.success) {
      return true;
    } else {
      throw DioExceptions;
    }
  }

  //Generic method template for create item on server
  Future<bool> makePostRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //Generic method template for update item on server
  Future<bool> makePutRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //Generic method template for delete item from server
  Future<bool> makeDeleteRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //Generic method template for getting data from Api
  Future<List<T>> makeGetRequest(Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    final Response response = await apiCallback;

    final List<T> items = List<T>.from(
      json
          .decode(json.encode(response.data))
          .map((item) => getJsonCallback(item)),
    );
    if (response.statusCode != null && response.statusCode.success) {
      return items;
    } else {
      throw DioExceptions;
    }
  }
}
