import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';

class DioHelper {
  Dio dio = Dio();

  DioHelper({required bool isToast}) {
    dio.options.baseUrl = RoloxKey.baseUrl!;
    dio.options.followRedirects = true;
    dio.options.headers.addAll(RoloxKey.acceptHeader!);
    // dio.options.headers[HttpHeaders.acceptHeader] = 'application/json';
    dio.options.validateStatus = (int? status) {
      return status! < 400;
    };
    dio.transformer = JsonTransformer();
    //setup auth interceptor
    _setupAuthInterceptor(
        isToast: isToast);
    //setup log for interceptor
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(responseBody: false));
    }
  }

  // ignore: always_declare_return_types
  _setupAuthInterceptor(
      {
      required bool isToast}) async {
    dio.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      options.headers.addAll(RoloxKey.header!);
      return handler.next(options);
    }, onResponse:
        (Response<dynamic> response, ResponseInterceptorHandler handler) async {
      return handler.next(response);
    }, onError: (DioError error, ErrorInterceptorHandler handler) async {
      if (isToast) {
        showToast(error.message!);
      }
      return handler.next(error);
    }));
  }

  showToast(String text) {

  }

  List<dynamic>? listOfMultiPart(List<File>? file) {
    final List<dynamic> multiPartValues = [];
    for (File element in file!) {
      multiPartValues.add(MultipartFile.fromFile(
        element.path,
        filename: element.path.split('/').last,
      ));
    }
    return multiPartValues;
  }
}

class JsonTransformer extends DefaultTransformer {
  JsonTransformer() : super(jsonDecodeCallback: _parseJson);
}

Map<String, dynamic> _parseAndDecode(String response) {
  return jsonDecode(response) as Map<String, dynamic>;
}

Future<Map<String, dynamic>> _parseJson(String text) {
  return compute(_parseAndDecode, text);
}
