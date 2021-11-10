/**
 * Copyright (C), 2015-2021, suntront
 * FileName: EventBus2Page
 * Author: Jeek
 * Date: 2021/4/13
 * Description:
 */
import 'package:flutter/material.dart';

class EventBus2Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EventBus2PageState();
  }
}

class _EventBus2PageState extends State<EventBus2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventBus2Page"),
      ),
      body: Center(
        child: Text("EventBus2Page"),
      ),
    );
  }
}