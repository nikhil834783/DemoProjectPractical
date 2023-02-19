import 'dart:developer';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../core/theme/const_color.dart';
import 'app_instance_values.dart';
class APIServices {
  //Post Method with dio noheader


//get dio api
  static dynamic getMethodWithHeaderDio(String url) async {
    onLoading();
    var dio = Dio();

    try {
      final response = await dio.get(
        url,
        options: Options(
          validateStatus: (_) => true,
          headers: {
            "Content-type": "application/json",
          },
        ),
      );
      //log('category response: ${response}');
      onLoadingClose();
      if (response.statusCode == 403 && response.statusCode == 404) {}
      final responseJson = response.data;
      print("=====responseJson===$responseJson");
      return responseJson;
    } catch (exception) {
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }



 
  static dynamic postWithAuthTokenDio(String url, var token) async {
    onLoading();
    var dio = Dio();
    try {
      final response = await dio.post(
        url,
        options: Options(
          headers: {
            "Content-type": "application/json",
            "AuthToken": token,
          },
        ),
      );
      log('$response-------');
      onLoadingClose();
      if (response.statusCode == 403 && response.statusCode == 404) {}
      final responseJson = response.data;
      return responseJson;
    } catch (exception) {
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static onLoading() async {
    if (AppInstance.instance.isAsync == false) {
      AppInstance.instance.isAsync = true;

      return showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return WillPopScope(
              onWillPop: () {
                return Future.value(true);
              },
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 60.h,
                        width: 60.h,
                        child: SpinKitCircle(
                          color: ConstColor.appBarColor,
                          size: 40.h,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        },
      );
    }
  }

  static onLoadingClose() {
    if (AppInstance.instance.isAsync) {
      AppInstance.instance.isAsync = false;
      Navigator.of(Get.context!, rootNavigator: true).pop('dialog');
    }
  }
}
