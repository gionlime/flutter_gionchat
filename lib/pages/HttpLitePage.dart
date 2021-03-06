/**
 * Copyright (C), 2015-2020, suntront
 * FileName: HttpLitePage
 * Author: Jeek
 * Date: 2020/12/14
 * Description:
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gionchat/bean/UserBean.dart';
import 'package:flutter_gionchat/common/http/HttpLite.dart';
import 'dart:convert';

import 'package:flutter_gionchat/common/utils/LogUtils.dart';

final String TAG = "HttpLitePage";

class HttpLitePage extends StatelessWidget {
  final SystemUiOverlayStyle _style =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(_style);
    // TODO: implement build
    return HttpLitePageStatefulWidget();
  }
}

class HttpLitePageStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HttpLitePageState();
  }
}

class _HttpLitePageState extends State<StatefulWidget> {

  String data = "HttpLite";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("HttpLitePage"),
      ),
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$data"),
            OutlineButton(
              child: Text("HttpLite"),
              onPressed: () {
                LogUtils.i("TAG", "Log");
                //HttpLite.getInstance().
                HttpLite.get("http://jsonplaceholder.typicode.com/posts/1", {})
                    .then((value) {
                  LogUtils.i(TAG, "jeek value => $value");
                  if(value != null) {
                    setState(() {
                      data = value.toString();
                    });
                    UserBean userBean = UserBean.fromJson(value);
                    LogUtils.i(TAG, "jeek userBean.id ${userBean.id}");
                    LogUtils.i(TAG, "jeek userBean.title ${userBean.title}");
                  }
                });
              },
            ),
          ],
        )
      ),
    );
  }
}
