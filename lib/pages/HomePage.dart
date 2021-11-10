/**
 * Copyright (C), 2015-2021, suntront
 * FileName: HomePage
 * Author: Jeek
 * Date: 2021/4/6
 * Description:
 */
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Center(
        child: Text("HomePage"),
      ),
    );
  }
}
