import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';
import 'package:roloxmoney/utils/dio_client.dart';

enum APIRequestType { get, post, put, delete, upload, download }

class RoloxGetXController extends GetxController with StateMixin {
  Future<Map<String, dynamic>> apiRequest(
      {required APIRequestType requestType,
      required String urlString,
      dynamic requestBodyData,
      List<File>? file,
      bool isEncryptionDecryptionEnabled = true,
      bool isToastEnable = true,
      String? savePath,
      Function(int received, int total)? callbackFunction}) async {
    debugPrint('requestBodyData-->${jsonEncode(requestBodyData)}');
    dynamic returnValue;
    try {
      final Response? response;
      switch (requestType) {
        case APIRequestType.get:
        case APIRequestType.delete:
          {
            response = requestType == APIRequestType.delete
                ? await DioHelper(isToast: isToastEnable).dio.delete(urlString)
                : await DioHelper(isToast: isToastEnable)
                    .dio
                    .get(urlString, queryParameters: requestBodyData);
            break;
          }
        case APIRequestType.upload:
          {
            final FormData data = FormData.fromMap({
              'file': DioHelper(isToast: isToastEnable).listOfMultiPart(file),
            });
            response = await DioHelper(isToast: isToastEnable)
                .dio
                .post(urlString, data: data);
            break;
          }
        case APIRequestType.download:
          {
            response = await DioHelper(isToast: isToastEnable).dio.download(
                urlString, savePath,
                onReceiveProgress: callbackFunction);
            break;
          }
        case APIRequestType.put:
          {
            response = await DioHelper(isToast: isToastEnable).dio.put(
                  urlString,
                  data: requestBodyData,
                );
            break;
          }
        case APIRequestType.post:
          {
            response = await DioHelper(isToast: isToastEnable)
                .dio
                .post(urlString, data: requestBodyData);
            break;
          }
        default:
          {
            response = await DioHelper(isToast: isToastEnable)
                .dio
                .post(urlString, data: requestBodyData);
            break;
          }
      }
      debugPrint('responseBodyData before encryption-->${response.data}');
      if (isEncryptionDecryptionEnabled) {
        if (response.data == null ||
            response.data is String ||
            response.data is bool ||
            response.data == '') {
          returnValue = {
            'success': false,
            'data': RoloxKey.errorMessage,
          };
        } else {
          returnValue = {
            'success': response.data == null ? false : true,
            'data': response.data ?? RoloxKey.errorMessage
          };
        }
      }
    } on DioError catch (e) {
      if (e.response!.data == null || e.response!.data is String) {
        returnValue = {
          'success': false,
          'data': RoloxKey.errorMessage,
        };
      } else {
        returnValue = {
          'success': false,
          'data': e.response!.data,
          'exception': e.error,
          'errorCode': e.response!.statusCode ?? 0
        };
      }
    }
    debugPrint(
        'urlString-->$urlString \n  requestBodyData-->${jsonEncode(requestBodyData)}'
        '\n  responseData-->$returnValue');
    return returnValue!;
  }
}
