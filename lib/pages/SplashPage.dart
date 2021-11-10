import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:get/get.dart';
/**
 * Copyright (C), 2015-2020, suntront
 * FileName: SplashPage
 * Author: Jeek
 * Date: 2020/12/16
 * Description:
 */

class SplashPage extends StatelessWidget {
  final SystemUiOverlayStyle _style =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);

  @override
  Widget build(BuildContext context) {
    if(Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(_style);
    }
    // TODO: implement build
    return SplashPageStatefulWidget();
  }
}

class SplashPageStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashPageState();
  }
}

class _SplashPageState extends State<StatefulWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Get.offNamed("/MainPage");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/splash.png"), fit: BoxFit.cover)),
      ),
    );
  }
}
