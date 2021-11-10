/**
 * Copyright (C), 2015-2021, suntront
 * FileName: BenchmarkPage
 * Author: Jeek
 * Date: 2021/4/8
 * Description:
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BenchmarkPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BenchmarkPageState();
  }
}

class _BenchmarkPageState extends State<BenchmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BenchmarkPage"),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            print("Benchmark");
            int before = new DateTime.now().millisecondsSinceEpoch;
            print("Benchmark before: $before");
            double j = 0;
            for(int i = 0; i < 10000000; i++){
              j = i * 3.36;
            }
            int after = new DateTime.now().millisecondsSinceEpoch;
            Get.snackbar("Benchmark", "time: ${after - before}");

          },
          child: Text("Benchmark"),
        ),
      ),
    );
  }
}
