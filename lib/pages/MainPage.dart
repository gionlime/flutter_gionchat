/**
 * Copyright (C), 2015-2021, suntront
 * FileName: MainPage
 * Author: Jeek
 * Date: 2021/4/9
 * Description:
 */
import 'package:flutter/material.dart';
import 'package:flutter_gionchat/bean/User.dart';
import 'package:flutter_gionchat/common/preference/Preference.dart';
import 'package:flutter_gionchat/controller/MainController.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, this.title = ""}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainPage> {
  final MainController mainController = Get.put(MainController());

  void _incrementCounter() {
    mainController.increment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("https://img.souutu.com/2020/0610/20200610050458320.jpg.1680.0.jpg"),
                  fit: BoxFit.cover
              )
          ),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 100,vertical: 50),
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Obx(() => Text(
                "getx: ${mainController.count}",
                style: TextStyle(fontSize: 30),
              )),
              SizedBox(height: 10,),
              ElevatedButton(
                  child: Text("Gex路由"),
                  onPressed: () {
                    print("Gex路由");
                    User user = User(name: "lijeek", age: 31);
                    Get.toNamed("/other", arguments: user);
                  }),
              SizedBox(height: 10,),

              SizedBox(height: 10,),
              ElevatedButton(
                  child: Text("Page404"),
                  onPressed: () {
                    print("Page404");
                    Get.toNamed("/page4041");
                  }),
              SizedBox(height: 10,),
              OutlinedButton(
                  onPressed: () {
                    print("修改主题");
                    Get.changeTheme(
                        Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                  },
                  child: Text("修改主题")),
              SizedBox(height: 10,),
              OutlinedButton(
                  onPressed: () {
                    print("Benchmark");
                    Get.toNamed("/benchmark");
                  },
                  child: Text("Benchmark")),
              SizedBox(height: 10,),
              OutlinedButton(
                onPressed: () {
                  print("Preference write");
                  Preference.write("jun", "李军军");
                },
                child: Text("Preference write"),
              ),
              SizedBox(height: 10,),
              OutlinedButton(
                onPressed: () {
                  print("Preference read ${Preference.read("jun")}" );
                },
                child: Text("Preference read"),
              ),
              OutlinedButton(
                onPressed: () {
                  print("HttpLite");
                  Get.toNamed("/HttpLitePage");
                },
                child: Text("HttpLite"),
              ),
              OutlinedButton(
                onPressed: () {
                  print("WebServiceLite");
                  Get.toNamed("/WebServiceLitePage");
                },
                child: Text("WebServiceLite"),
              ),
              OutlinedButton(
                onPressed: () {
                  print("FileUtilsPage");
                  Get.toNamed("/FileUtilsPage");
                },
                child: Text("FileUtilsPage"),
              ),

              OutlinedButton(
                onPressed: () {
                  print("FileUploadPage");
                  Get.toNamed("/FileUploadPage");
                },
                child: Text("FileUploadPage"),
              ),
              OutlinedButton(
                onPressed: () {
                  print("ListViewPage");
                  Get.toNamed("/ListViewPage");
                },
                child: Text("ListViewPage"),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}