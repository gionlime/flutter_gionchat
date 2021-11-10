import 'package:flutter/material.dart';
import 'package:flutter_gionchat/controller/MainController.dart';
import 'package:flutter_gionchat/pages/BenchmarkPage.dart';
import 'package:flutter_gionchat/pages/FileUploadPage.dart';
import 'package:flutter_gionchat/pages/FileUtilsPage.dart';
import 'package:flutter_gionchat/pages/HttpLitePage.dart';
import 'package:flutter_gionchat/pages/ListViewPage.dart';
import 'package:flutter_gionchat/pages/MainPage.dart';
import 'package:flutter_gionchat/pages/OtherPage.dart';
import 'package:flutter_gionchat/pages/Page404.dart';
import 'package:flutter_gionchat/pages/SplashPage.dart';
import 'package:flutter_gionchat/pages/WebServiceLitePage.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'common/preference/Preference.dart';

void main() async{
  await Preference.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: (GetPlatform.isAndroid || GetPlatform.isIOS)? SplashPage(): MainPage(),
      getPages: [
        GetPage(name: "/MainPage", page: () => MainPage()),
        GetPage(name: "/other", page: () => OtherPage()),
        GetPage(name: "/404", page: () => Page404()),
        GetPage(name: "/benchmark", page: () => BenchmarkPage()),
        GetPage(name: "/HttpLitePage", page: () => HttpLitePage()),
        GetPage(name: "/WebServiceLitePage", page: () => WebServiceLitePage()),
        GetPage(name: "/FileUtilsPage", page: () => FileUtilsPage()),
        GetPage(name: "/FileUploadPage", page: () => FileUploadPage()),
        GetPage(name: "/ListViewPage", page: () => ListViewPage()),
      ],
      unknownRoute: GetPage(name: "/404", page: () => Page404()),
    );
  }
}

