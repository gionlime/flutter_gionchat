import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_gionchat/common/utils/LogUtils.dart';
import 'package:fluttertoast/fluttertoast.dart';

/**
 * Copyright (C), 2015-2020, suntront
 * FileName: HttpLite
 * Author: Jeek
 * Date: 2020/12/13
 * Description:
 */
class HttpLite {
  static final String TAG = "HttpLite";
  static Dio _dio = Dio(BaseOptions(
    connectTimeout: 15000,
    receiveTimeout: 15000,
    sendTimeout: 15000,
    responseType: ResponseType.json,
  ));

  static Future<bool> checkNetConnect() async {
    if (Platform.isAndroid || Platform.isIOS) {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (!(connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi)) {
        Fluttertoast.showToast(msg: "网络未连接");
        return false;
      }
    }

    return true;
  }

  static Future<Map<dynamic, dynamic>> get(
      String url, Map<String, dynamic> params) async {

    bool isConnect = await checkNetConnect();
    if(!isConnect){
      return {};
    }
    Response respnse = await _dio.get(url, queryParameters: params);
    Map data = jsonDecode(respnse.toString());
    LogUtils.i(TAG, "url: ${url} | data => ${data.toString()}");
    return data;
  }

  static Future<Map<dynamic, dynamic>> post(
      String url, Map<String, dynamic> params) async {
    bool isConnect = await checkNetConnect();
    if(!isConnect){
      return {};
    }

    Response respnse = await _dio.post(url, queryParameters: params);
    Map data = jsonDecode(respnse.toString());
    LogUtils.i(TAG, "url: ${url} | data => ${data.toString()}");
    return data;
  }

  static Future<Map<dynamic, dynamic>> put(
      String url, Map<String, dynamic> params) async {
    bool isConnect = await checkNetConnect();
    if(!isConnect){
      return {};
    }

    Response respnse = await _dio.put(url, queryParameters: params);
    Map data = jsonDecode(respnse.toString());
    LogUtils.i(TAG, "url: ${url} | data => ${data.toString()}");
    return data;
  }

  static Future<Map<dynamic, dynamic>> delete(
      String url, Map<String, dynamic> params) async {
    bool isConnect = await checkNetConnect();
    if(!isConnect){
      return {};
    }

    Response respnse = await _dio.delete(url, queryParameters: params);
    Map data = jsonDecode(respnse.toString());
    LogUtils.i(TAG, "url: ${url} | data => ${data.toString()}");
    return data;
  }

  static Future<Map<dynamic, dynamic>> patch(
      String url, Map<String, dynamic> params) async {
    bool isConnect = await checkNetConnect();
    if(!isConnect){
      return {};
    }

    Response respnse = await _dio.patch(url, queryParameters: params);
    Map data = jsonDecode(respnse.toString());
    LogUtils.i(TAG, "url: ${url} | data => ${data.toString()}");
    return data;
  }

  static Future<Map<dynamic, dynamic>> formData(
      String url, Map<String, dynamic> params) async {
    bool isConnect = await checkNetConnect();
    if(!isConnect){
      return {};
    }

    var formDataParams = FormData.fromMap(params);
    Response respnse = await _dio.post(url, data: formDataParams);
    Map data = jsonDecode(respnse.toString());
    LogUtils.i(TAG, "url: ${url} | data => ${data.toString()}");
    return data;
  }

  static Future<Map<dynamic, dynamic>> upload(String url, filePath) async {
    bool isConnect = await checkNetConnect();
    if(!isConnect){
      return {};
    }

    var formDataParams = FormData.fromMap({
      'client': "android",
      'file': await MultipartFile.fromFile(filePath, filename: 'upload.png'),
    });
    Response respnse = await _dio.post(url, data: formDataParams);
    Map data = jsonDecode(respnse.toString());
    LogUtils.i(TAG, "url: ${url} | data => ${data.toString()}");
    return data;
  }

  static Future<Map<dynamic, dynamic>> download(String url) async {
    bool isConnect = await checkNetConnect();
    if(!isConnect){
      return {};
    }

    Response respnse = await _dio.download(url, './xx.html');
    Map data = jsonDecode(respnse.toString());
    LogUtils.i(TAG, "url: ${url} | data => ${data.toString()}");
    return data;
  }
}
