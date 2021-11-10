/**
 * Copyright (C), 2015-2021, suntront
 * FileName: OtherPage
 * Author: Jeek
 * Date: 2021/4/6
 * Description:
 */
import 'package:flutter/material.dart';
import 'package:flutter_gionchat/bean/User.dart';
import 'package:flutter_gionchat/controller/MainController.dart';
import 'package:get/get.dart';


class OtherPage extends StatelessWidget {
  final MainController mainController = Get.find();
  final params = Get.arguments as User;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OtherPage"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("OtherPage: ${mainController.count}"),
            Text("name: ${params.name} age: ${params.age}")
          ],
        ),
      ),
    );
  }
}
