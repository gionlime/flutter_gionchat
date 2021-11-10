/**
 * Copyright (C), 2015-2021, suntront
 * FileName: EventBus1Page
 * Author: Jeek
 * Date: 2021/4/13
 * Description:
 */
import 'package:flutter/material.dart';

class EventBus1Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EventBus1PageState();
  }
}

class _EventBus1PageState extends State<EventBus1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventBus1Page"),
      ),
      body: Center(
        child: Text("EventBus1Page"),
      ),
    );
  }
}